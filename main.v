module main

import einar_hjortdal.peony

fn main() {
	bp := peony.new_provider_blob_blobly('', '')
	mut app := peony.new_peony_app(bp)
	app.run()
}
