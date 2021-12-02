import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';

export const getImage_Sliders = async ({ searchKeyword = '' }) => {
	try {
		let queryString = '?';
		if (searchKeyword) queryString += `q=${searchKeyword}`;
		const url = `${apiUrl}/image_sliders${queryString}`;
		const response = await fetch(url, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
			},
		});
		const image_sliders = await response.json();
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		}
		return image_sliders;
	} catch (err) {
		console.log(err);
		return { error: err.Error || err.message };
	}
};