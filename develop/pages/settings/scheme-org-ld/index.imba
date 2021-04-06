import './index.styl'
import SchemeOrg from './scheme-org-datastate'

tag ListItemTypeHr
	prop propertes default: []

	def toggleOpen
		@open = !@open

	def render
		<self>
			<hr .close=!@open :click.toggleOpen> <legend> data.label
			<ul> for item in data.propertyDomainIncludesOf
				<ListItemType[ item ] propertes=@propertes>

tag ListItemPropertes < li
	def render
		<self>
			for item in data:types
				<ListItemTypeHr[ SchemeOrg.getElement( item  ) ] propertes=data:propertes>

tag ListItemTypeSub < li
	def render
		<self> <ul> for item in data.supClassOf
			<ListItemType[ item ]>

tag ListItemType < li
	prop propertes default: []

	def render
		<self>
			<span> data.label
			if data:rangeIncludes isa Function then <span> for item in data.rangeIncludes
				<samp .selected=@propertes.includes( item.id )> item.label
			<kbd> <i.iq.help.circle>

export tag Sketch
	prop types
	prop propertes

	@classes = ['SchemeOrgState']

	def setTypes v
		@types = v
		self

	def setData v
		types = [].concat v:types or ['Thing']
		propertes = [].concat v:propertes or []
		@data =
			types: types
			propertes: propertes
		self

	def lastType
		SchemeOrg.getElement @types[ @types:length - 1 ]

	def render
		<self>
			if SchemeOrg.loading then <.loading>
			else
				<ul>
					for item in @types
						<ListItemType[ SchemeOrg.getElement item ]>
					<ListItemTypeSub[ lastType ]>
					<ListItemPropertes[ data ]>
