
const logoQwars = require './images/Qwars-logo.svg'

export tag Sketch < header
	@classes = []

	def toggleNavigation
		application.main-nav-open = not application.main-nav-open

	def render
		<self>
			<kbd :click.toggleNavigation> <i.iq.bars>
			<a route-to="/">
				<span>
					<i.iq.ir-teamspeak>
					<i> <img src=logoQwars>
				<dfn> "Work for yourself"
			<nav>
				<a route-to="/themes"> "Themes UI"
				<a route-to="/settings"> "Settings UI"
				<a route-to="/form-fields"> "Form fields UI"
				<a route-to="/blocks"> "Blocks UI"
				<a route-to="/icons"> "Icons UI"
				<a route-to="/snippets"> "Snippets"
				<aside>

			<aside>

