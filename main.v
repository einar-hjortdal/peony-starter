module main

import einar_hjortdal.peony
import os

const env_blobly_url = 'BLOBLY_URL'
const env_blobly_secret_key = 'BLOBLY_SECRET_KEYS'
const env_blobly_access_key = 'BLOBLY_ACCESS_KEYS'

fn main() {
	blobly_url := os.getenv(env_blobly_url)
	blobly_secret_keys := os.getenv(env_blobly_secret_key).split(',')
	blobly_access_keys := os.getenv(env_blobly_access_key).split(',')

	bp := peony.new_provider_blob_blobly(blobly_url, blobly_access_keys, blobly_secret_keys)

	mut app := peony.new_peony_app(bp)
	app.run()
}
