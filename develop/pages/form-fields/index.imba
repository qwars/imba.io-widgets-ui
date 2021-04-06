
import Sketch as CheckboxArticle from './checkbox'

export tag Aside < section
	def render
		<self>

export tag Nav < ul

	def render
		<self>
			<li> <a route-to="/form-fields/checkbox">
				<abbr><i.iq.input><i.iq.switch>
				<span> "Checkbox fields"

			<li> <a route-to="/form-fields/input-string">
				<abbr><i.iq.input><i.iq.cursor>
				<span> "String fields"

			<li> <a route-to="/form-fields/input-number">
				<abbr><i.iq.input><i.iq.number>
				<span> "Number fields"

			<li> <a route-to="/form-fields/input-select">
				<abbr><i.iq.input><i.iq.chevron-down.small>
				<span> "Select fields"

			<li> <a route-to="/form-fields/input-text">
				<abbr><i.iq.input><i.iq.code.small>
				<span> "Text fields"

			<li> <a route-to="/form-fields/input-range">
				<abbr><i.iq.input><i.iq.range>
				<span> "Range fields"

			<li> <a route-to="/form-fields/input-file">
				<abbr><i.iq.input><i.iq.file>
				<span> "File fields"

			<li> <a route-to="/form-fields/input-date">
				<abbr><i.iq.input><i.iq.calendar>
				<span> "Date fields"

			<li> <a route-to="/form-fields/input-geo">
				<abbr><i.iq.input><i.iq.geo-point>
				<span> "Geo fields"

export tag Section < section
	def render
		<self>
			<CheckboxArticle route="/form-fields/checkbox">