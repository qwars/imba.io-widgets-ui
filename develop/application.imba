
export tag Application < output
	prop main-nav-open default: false

	def setup
		const datastate = self
		extend tag element
			def application
				datastate

	def render
		<self>