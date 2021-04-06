
const Pg = require './pages'


import Section as PagesArticle, Nav as PagesNav, Aside as PagesAside  from './pages'
import Section as ThemesArticle, Nav as ThemesNav, Aside as ThemesAside  from './pages/themes'
import Section as SettingsArticle, Nav as SettingsNav, Aside as SettingsAside  from './pages/settings'
import Section as FormFieldsArticle, Nav as FormFieldsNav, Aside as FormFieldsAside  from './pages/form-fields'
import Section as BlocksArticle, Nav as BlocksNav, Aside as BlocksAside  from './pages/blocks'
import Section as IconsArticle, Nav as IconsNav, Aside as IconsAside  from './pages/icons'
import Section as SnippetsArticle, Nav as SnippetsNav, Aside as SnippetsAside  from './pages/snippets'

tag AsidePage < aside
	def render
		<self>
			<PagesAside route="/*$">
			<ThemesAside route="/themes/*:document*/*:field*">
			<SettingsAside route="/settings/*:document*/*:field*">
			<FormFieldsAside route="/form-fields/*:document*/*:field*">
			<BlocksAside route="/blocks/*:document*/*:field*">
			<IconsAside route="/icons/*:document*/*:field*">
			<SnippetsAside route="/snippets/*:document*/*:field*">

tag ArticlePage < section
	def render
		<self>
			<PagesArticle route="/*$">
			<ThemesArticle route="/themes/*:document*/*:field*">
			<SettingsArticle route="/settings/*:document*/*:field*">
			<FormFieldsArticle route="/form-fields/*:document*/*:field*">
			<BlocksArticle route="/blocks/*:document*/*:field*">
			<IconsArticle route="/icons/*:document*/*:field*">
			<SnippetsArticle route="/snippets/*:document*/*:field*">

tag NavigationPage < nav
	def toggleNavigation
		application.main-nav-open = not application.main-nav-open

	def render
		<self>
			<aside>
			<PagesNav route="/*$">
			<ThemesNav route="/themes/*:document*/*:field*">
			<SettingsNav route="/settings/*:document*/*:field*">
			<FormFieldsNav route="/form-fields/*:document*/*:field*">
			<BlocksNav route="/blocks/*:document*/*:field*">
			<IconsNav route="/icons/*:document*/*:field*">
			<SnippetsNav route="/snippets/*:document*/*:field*">
			<kbd :click.toggleNavigation><i.iq.bars>


export tag Sketch < main
	@classes = []

	def render
		<self>
			<NavigationPage .open=application.main-nav-open route="/:collection/*:document*/*:field*">
			<PagesNav attr:open=application.main-nav-open route="/*$">
			<ArticlePage route="/:collection/*:document*/*:field*">
			<PagesArticle route="/*$">
			<AsidePage route="/:collection/*:document*/*:field*">
			<PagesAside route="/*$">