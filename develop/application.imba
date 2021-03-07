
class RouteState

	def initialize pathstate
		@reference = Array.from Set.new window:location:pathname.split '/'
		for item, idx in Array.from Set.new pathstate.split '/'
			# this[ item ] = reference[ idx ] if item
			Object.defineProperty this, item,
				get: do window:location:pathname.split('/')[ idx ]

const routestate = RouteState.new '/collection/doc/fields'

export tag Application < output

	def setup
		const datastate = self
		extend tag element
			get application
				datastate
			get reference
				routestate

	def render
		<self>