
export const createReview = async (productId, review) => {
	try {
		const { token } = getUserInfo();
		const response = await axios({
			url: `${apiUrl}/api/products/${productId}/reviews`,
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				Authorization: `Bearer ${token}`,
			},
			data: review,
		});
		if (response.statusText !== 'Created') {
			throw new Error(response.data.message);
		}
		return response.data;
	} catch (err) {
		return { error: err.response.data.message || err.message };
	}
};




