import Header from './components/Header.js';
import Aside from './components/Aside.js';
import Error404Screen from './screens/Error404Screen.js';
import { parseRequestUrl, showLoading, hideLoading } from './utils.js';
import { routes } from './route.js';
import Footer from './components/Footer.js';

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

    // 	const footer = document.getElementById('footer-container');
    // 	footer.innerHTML = await Footer.render();
    // 	await Footer.after_render();
    // 	hideLoading();
    // >>>>>>> 5bd63976dab1b9dc13f155c6fbc16a17bc325ac5
};


window.addEventListener('load', () => {
    router();

});
window.addEventListener('hashchange', () => {
    router();
});