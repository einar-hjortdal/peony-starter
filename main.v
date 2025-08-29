module main

import os
import einar_hjortdal.dotenv
import einar_hjortdal.peony

const env_blobly_url = 'BLOBLY_URL'
const env_blobly_keys = 'BLOBLY_KEYS'

fn main() {
	dotenv.load()

	blobly_url := os.getenv(env_blobly_url)
	blobly_keys := os.getenv(env_blobly_keys).split('=')
	blobly_access_key := blobly_keys[0]
	blobly_secret_key := blobly_keys[1]

	bp := peony.new_provider_blob_blobly(blobly_url, blobly_access_key, blobly_secret_key)

	// You can register your custom veb middleware on app
	mut app := peony.new_peony_app(bp)
	app.run()
}
