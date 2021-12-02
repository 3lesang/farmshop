import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';

export const getSupplier = async (id) => {
	try {
		const url = `${apiUrl}/suppliers/${id}`;
		const response = await fetch(url, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		const supplier = await response.json();
		return supplier;
	} catch (err) {
		console.log(err);
		return { error: err.message };
	}
};