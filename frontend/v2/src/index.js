import Header from './components/Header.js';
import Aside from './components/Aside.js';
import Error404Screen from './screens/Error404Screen.js';
// import { getProducts } from './card.js';
import { parseRequestUrl, showLoading, hideLoading } from './utils.js';
import { routes } from './route.js';
const header = document.getElementById('header-container');
// const loadLayout = async () => {
// 	header.innerHTML = await Header.render();
// 	await Header.after_render();

// 	const aside = document.getElementById('aside-container');
// 	aside.innerHTML = await Aside.render();
// 	await Aside.after_render();
// };

// const router = async () => {
// 	showLoading();
// 	const request = parseRequestUrl();
// 	const parseUrl =
// 		(request.resource ? `/${request.resource}` : '/') +
// 		(request.id ? '/:id' : '') +
// 		(request.verb ? `/${request.verb}` : '');
// 	console.log(request);
// 	const screen = routes[parseUrl] ? routes[parseUrl] : Error404Screen;
// const header = document.getElementById('header-container');
// header.innerHTML = await Header.render();
// await Header.after_render();

// const aside = document.getElementById('aside-container');
// aside.innerHTML = await Aside.render();
// await Aside.after_render();

// switch (parseUrl) {
// 	case '/':
// 	case '/product/:id':
// 		const main = document.getElementById('main-container');
// 		main.innerHTML = await screen.render();
// 		if (screen.after_render) await screen.after_render();
// 		break;
// 	default:
// 		const page = document.getElementById('page');
// 		page.innerHTML = await screen.render();
// 		if (screen.after_render) await screen.after_render();
// 		break;
// }

// hideLoading();
// document.querySelector('.products').innerHTML = card.render();
// };
const router = async () => {
	showLoading();
	const request = parseRequestUrl();
	const parseUrl =
		(request.resource ? `/${request.resource}` : '/') +
		(request.id ? '/:id' : '') +
		(request.verb ? `/${request.verb}` : '');
	console.log(request);
	const screen = routes[parseUrl] ? routes[parseUrl] : Error404Screen;
	const header = document.getElementById('header-container');
	header.innerHTML = await Header.render();
	await Header.after_render();

	const aside = document.getElementById('aside-container');
	aside.innerHTML = await Aside.render();
	await Aside.after_render();

	const main = document.getElementById('main-container');
	main.innerHTML = await screen.render();
	if (screen.after_render) await screen.after_render();
	hideLoading();
};
window.addEventListener('load', () => {
	// loadLayout();
	router();
});
window.addEventListener('hashchange', () => {
	router();
});
