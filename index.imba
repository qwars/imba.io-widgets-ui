
class Scheme
	prop source default: Map.new
	prop loading

	def getElement name
		if name and name isa String then @source.get name.includes(':') ? name : "schema:{name}"
		else name

	def initialize
		const toItemMap = do source.set $1['@id'], SchemeElement.new $1
		@loading = Promise.new do|resolve, reject |
			window.fetch( 'https://schema.org/version/latest/schemaorg-all-http.jsonld' ).catch( do|error| @loading = console.log reject Imba.commit @error = error )
			.then( do|response| response:ok and await response.json )
			.then( do|resource| resource['@graph'].map( do |item| resource['@context'][ item['@id'] ] = item ) and resource )
			.then( do|resource| resource['@graph'].map( do |item|
				item['@type'] = [].concat( item['@type'] ).map do |t| t.replace /(schema|rdf(s)*)[:]/, ''
				if item["rdfs:subClassOf"] then [].concat( item["rdfs:subClassOf"] ).map do|supClass|
					supClass['@id'] = supClass['@id'].replace 'rdfs', 'schema'
					supClass['@id'] = supClass['@id'].replace 'rdf', 'schema'
					if resource['@context'][ supClass['@id'] ]
						resource['@context'][ supClass['@id'] ]['rdfs:supClassOf'] = Set.new unless resource['@context'][ supClass['@id'] ]['rdfs:supClassOf']
						resource['@context'][ supClass['@id'] ]['rdfs:supClassOf'].add item['@id']
					else console.log item['@id'], supClass['@id']
				if item['@type'].includes 'Property'
					[].concat( item['schema:domainIncludes'] or [] ).map do|propertyOf|
						resource['@context'][ propertyOf['@id'] ]['rdfs:propertyDomainIncludesOf'] = Set.new unless resource['@context'][ propertyOf['@id'] ]['rdfs:propertyDomainIncludesOf']
						resource['@context'][ propertyOf['@id'] ]['rdfs:propertyDomainIncludesOf'].add item['@id']
					[].concat( item['schema:rangeIncludes'] or [] ).map do|propertyOf|
						resource['@context'][ propertyOf['@id'] ]['rdfs:propertyRangeIncludesOf'] = Set.new unless resource['@context'][ propertyOf['@id'] ]['rdfs:propertyRangeIncludesOf']
						resource['@context'][ propertyOf['@id'] ]['rdfs:propertyRangeIncludesOf'].add item['@id']
					[].concat( item['rdfs:subPropertyOf'] or [] ).map do|propertyOf|
						if resource['@context'][ propertyOf['@id'] ]
							resource['@context'][ propertyOf['@id'] ]['rdfs:supPropertyOf'] = Set.new unless resource['@context'][ propertyOf['@id'] ]['rdfs:supPropertyOf']
							resource['@context'][ propertyOf['@id'] ]['rdfs:supPropertyOf'].add item['@id']
			) and resource )
			.then( do|resource| resolve @source unless @loading = Imba.commit resource['@graph'].map toItemMap.bind self )

const SchemeOrg = Scheme.new

const getElementItem = do|item| SchemeOrg.getElement item['@id']

const getSupClassOf = do @source:supClassOf

const keyses =
	"@id": do this["@id"].replace 'schema:', ''
	"@type": do this["@type"]
	"rdfs:comment": do this["rdfs:comment"]
	"rdfs:label": do this["rdfs:label"]
	"rdfs:subClassOf": do [].concat( this["rdfs:subClassOf"] ).map getElementItem
	"rdfs:supClassOf": do this["rdfs:supClassOf"].map do|item| SchemeOrg.getElement item
	"rdfs:propertyDomainIncludesOf": do this["rdfs:propertyDomainIncludesOf"].map do|item| SchemeOrg.getElement item
	"rdfs:propertyRangeIncludesOf": do this["rdfs:propertyRangeIncludesOf"].map do|item| SchemeOrg.getElement item
	"schema:isPartOf": do this["schema:isPartOf"]
	"schema:domainIncludes": do [].concat( this["schema:domainIncludes"] ).map getElementItem
	"schema:rangeIncludes": do [].concat( this["schema:rangeIncludes"] ).map getElementItem
	"schema:source": do [].concat( this["schema:source"] ).map do|item| item['@id']
	"http://www.w3.org/2002/07/owl#equivalentClass": do [].concat( this["http://www.w3.org/2002/07/owl#equivalentClass"] ).map do|item| item['@id']
	"http://www.w3.org/2004/02/skos/core#exactMatch": do this["http://www.w3.org/2004/02/skos/core#exactMatch"]['@id']
	"http://www.w3.org/2002/07/owl#equivalentProperty": do this["http://www.w3.org/2002/07/owl#equivalentProperty"]['@id']
	"rdfs:subPropertyOf": do [].concat( this["rdfs:subPropertyOf"] ).map getElementItem
	"rdfs:supPropertyOf": do [].concat( this["rdfs:supPropertyOf"] ).map do|item| SchemeOrg.getElement item
	"schema:supersededBy": do SchemeOrg.getElement this["schema:supersededBy"]['@id']
	"schema:inverseOf": do SchemeOrg.getElement this["schema:inverseOf"]['@id']
	"schema:sameAs": do this["schema:sameAs"]['@id']
	"http://www.w3.org/2004/02/skos/core#closeMatch": do [].concat( this["http://www.w3.org/2004/02/skos/core#closeMatch"] ).map do|item| item['@id']

class SchemeElement
	prop source

	def initialize el
		@source = el
		for item in Object.keys el
			if el[item] isa Set then el[item] = Array.from el[item].values()
			if item.includes "@" then self[ item.replace "@", "" ] = keyses[item].bind el
			else if item.includes "#" then self[ item.split("#")[1] ] = keyses[item].bind el
			else if item.includes ":" then self[ item.split(":")[1] ] = keyses[item].bind el
			else self[ item ] = keyses[item].bind self

export SchemeOrg