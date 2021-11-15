import { apiUrl } from '../conf.js';
import { getUserInfo } from '../localStorage.js';
export const getSummary = async () => {
	try {
        const url = `${apiUrl}/summary`;
		const { token } = getUserInfo();
		const response = await fetch(url, {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
				'Authorization': `Bearer ${token}`,
			},
		});
		if (response.statusText !== 'OK') {
			throw new Error(response.Error);
		} else {
            const data = await response.json();
            return data;
		}
	} catch (err) {
		return {
			error: err.message,
		};
	}
};