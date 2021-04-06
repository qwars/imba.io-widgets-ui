
import './index.styl'

const ColorsCSS = [
	{ label: 'var( --title-color )', comment: 'Color of title' },
	{ label: 'var( --text-color )', comment: 'Color of text' },
	{ label: 'var( --extra-color )', comment: 'Color of definition text' },

	{ label: 'var( --link-color )', comment: 'Color of :link link text' },
	{ label: 'var( --active-color )', comment: 'Color of :active' },
	{ label: 'var( --hover-color )', comment: 'Color of :hover' },
	{ label: 'var( --visited-color )', comment: 'Color of :visited' },

	{ label: 'var( --focus-color )', comment: 'Color of :focus' },
	{ label: 'var( --checked-color )', comment: 'Color of :checked' },

	{ label: 'var( --canvas-color )', comment: 'Color of background' },
	{ label: 'var( --r-color )', comment: 'Color of main red' },
	{ label: 'var( --g-color )', comment: 'Color of main green' },
	{ label: 'var( --b-color )', comment: 'Color of main blue' },
	{ label: 'var( --border-color )', comment: 'Color of border' },

	{ label: 'var( --disabled-color )', comment: 'Color of disabled' },
	{ label: 'var( --invalid-color )', comment: 'Color of :invalid' },
	{ label: 'var( --info-color )', comment: 'Color of :info' },
	{ label: 'var( --warning-color )', comment: 'Color of :warning' }

]

const SystemColorsCSS = [
	{ label: 'ActiveText', comment: 'Text of active links' },
	{ label: 'ButtonFace', comment: 'Background color of controls' }
	{ label: 'ButtonText', comment: 'Foreground color of controls' }
	{ label: 'Canvas', comment: 'Background of application content or documents' }
	{ label: 'CanvasText', comment: 'Foreground color in application content or documents' }
	{ label: 'Field', comment: 'Background of input fields' }
	{ label: 'FieldText', comment: 'Text in input fields' }
	{ label: 'GrayText', comment: 'Foreground color for disabled items (e.g. a disabled control)' }
	{ label: 'Highlight', comment: 'Background of selected items' }
	{ label: 'HighlightText', comment: 'Foreground color of selected items' }
	{ label: 'LinkText', comment: 'Text of non-active, non-visited links' }
	{ label: 'Mark', comment: 'Background of text that has been specially marked (such as by the HTML mark element)' }
	{ label: 'MarkText', comment: 'Text that has been specially marked (such as by the HTML mark element)' }
	{ label: 'VisitedText', comment: 'Text of visited links' }
]

const DeprecatedColorsCSS = [
	{ label: 'ActiveBorder', comment: 'Active window border.' },
	{ label: 'ActiveCaption', comment: 'Active window caption. Should be used with CaptionText as foreground color.' },
	{ label: 'AppWorkspace', comment: 'Background color of multiple document interface.' },
	{ label: 'Background', comment: 'Desktop background.' },
	{ label: 'ButtonHighlight', comment: 'The color of the border facing the light source for 3-D elements that appear 3-D due to that layer of surrounding border.' },
	{ label: 'ButtonShadow', comment: 'The color of the border away from the light source for 3-D elements that appear 3-D due to that layer of surrounding border.' },
	{ label: 'CaptionText', comment: 'Text in caption, size box, and scrollbar arrow box. Should be used with the ActiveCaption background color.' },
	{ label: 'InactiveBorder', comment: 'Inactive window border.' },
	{ label: 'InactiveCaption', comment: 'Inactive window caption. Should be used with the InactiveCaptionText foreground color.' },
	{ label: 'InactiveCaptionText', comment: 'Color of text in an inactive caption. Should be used with the InactiveCaption background color.' },
	{ label: 'InfoBackground', comment: 'Background color for tooltip controls. Should be used with the InfoText foreground color.' },
	{ label: 'InfoText', comment: 'Text color for tooltip controls. Should be used with the InfoBackground background color.' },
	{ label: 'Menu', comment: 'Menu background. Should be used with the MenuText or -moz-MenuBarText foreground color.' },
	{ label: 'MenuText', comment: 'Text in menus. Should be used with the Menu background color.' },
	{ label: 'Scrollbar', comment: 'Background color of scroll bars.' },
	{ label: 'ThreeDDarkShadow', comment: 'The color of the darker (generally outer) of the two borders away from the light source for 3-D elements that appear 3-D due to two concentric layers of surrounding border.' },
	{ label: 'ThreeDFace', comment: 'The face background color for 3-D elements that appear 3-D due to two concentric layers of surrounding border. Should be used with the ButtonText foreground color.' },
	{ label: 'ThreeDHighlight', comment: 'The color of the lighter (generally outer) of the two borders facing the light source for 3-D elements that appear 3-D due to two concentric layers of surrounding border.' },
	{ label: 'ThreeDLightShadow', comment: 'The color of the darker (generally inner) of the two borders facing the light source for 3-D elements that appear 3-D due to two concentric layers of surrounding border.' },
	{ label: 'ThreeDShadow', comment: 'The color of the lighter (generally inner) of the two borders away from the light source for 3-D elements that appear 3-D due to two concentric layers of surrounding border.' },
	{ label: 'Window', comment: 'Window background. Should be used with the WindowText foreground color.' },
	{ label: 'WindowFrame', comment: 'Window frame.' },
	{ label: 'WindowText', comment: 'Text in windows. Should be used with the Window background color.' }
]

export tag Sketch < section

	def render
		<self.SchemeColors>
			<div>
				<ul> for item in ColorsCSS
					<li>
						<div css:backgroundColor=item:label>
						<samp> item:label
						<span> item:comment
				<ul.dark-theme> for item in ColorsCSS
					<li>
						<div css:backgroundColor=item:label>
						<samp> item:label
						<span> item:comment

			<hr> <legend> "System color keywords"
			<ul> for item in SystemColorsCSS
				<li>
					<div css:backgroundColor=item:label>
					<samp> item:label
					<span> item:comment

			<hr> <legend> "Deprecated system color keywords"
			<ul> for item in DeprecatedColorsCSS
				<li>
					<div css:backgroundColor=item:label>
					<samp> item:label
					<span> item:comment
