
import Sketch as SchemeOrgLD from './scheme-org-ld'

export tag Aside < section
	def render
		<self>

export tag Nav < ul
	def render
		<self>
			<li> <a route-to="/settings/scheme-org">
				<abbr><i.iq.input><i.iq.switch>
				<span> "Scheme.org - microcode"

export tag Section < section
	prop seti default: {}
	def render
		<self>
			<SchemeOrgLD[ @seti ]  route="/settings/scheme-org">