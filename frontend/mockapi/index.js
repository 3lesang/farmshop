import { register, deleteUser } from './api.js';
const btn = document.getElementById('form');
const dlt = document.getElementById('delete');
btn.addEventListener('submit', async (e) => {
	e.preventDefault();
	const data = {
		name: 'sang',
		email: 'sang@gmail.com',
		password: 'sang2403',
		isAdmin: false,
	};
	const res = await register(data);
});
dlt.addEventListener('click', async (e) => {
	e.preventDefault();
	const id = 7;
	const res = await deleteUser(id);
});
