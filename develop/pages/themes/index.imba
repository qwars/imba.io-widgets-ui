import Sketch as SchemeColors from './scheme-colors'


export tag Aside < section
	def render
		<self>

export tag Nav < ul
	def render
		<self>
			<li> <a route-to="/themes/scheme-colors">
				<abbr><i.iq.input><i.iq.palette>
				<span> "Default scheme colors"

export tag Section < section
	def render
		<self>
			<SchemeColors route="/themes/scheme-colors">
