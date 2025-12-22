module main

import os
import time
import strconv
import einar_hjortdal.dotenv
import einar_hjortdal.peony

const env_debug = 'DEBUG'
const env_default_user_email = 'EMAIL'
const env_default_user_password = 'PASSWORD'
const env_session_secret = 'SESSION_SECRET'
const env_firebird_url = 'FIREBIRD_URL'
const env_redict_url = 'REDICT_URL'
const env_port = 'PORT'
const env_cache_duration = 'CACHE_DURATION' // in seconds
const env_session_max_age = 'SESSION_MAX_AGE' // in seconds
const env_session_name = 'SESSION_NAME'
const env_session_refresh_expire = 'SESSION_REFRESH_EXPIRE'
const env_session_admin_prefix = 'SESSION_ADMIN_PREFIX'
const env_admin_frontend_url = 'ADMIN_FRONTEND_URL'
const env_store_frotnend_url = 'STORE_FRONTEND_URL'
const env_blobly_url = 'BLOBLY_URL'
const env_blobly_keys = 'BLOBLY_KEYS'

fn parse_bool(s string) bool {
	string_true := ['1', 't', 'T', 'TRUE', 'true', 'True']
	for value in string_true {
		if s == value {
			return true
		}
	}
	return false
}

fn main() {
	dotenv.load()

	blobly_url := os.getenv(env_blobly_url)
	blobly_keys := os.getenv(env_blobly_keys).split('=')
	blobly_access_key := blobly_keys[0]
	blobly_secret_key := blobly_keys[1]

	config := peony.Config{
		default_user_email:     os.getenv(env_default_user_email)
		default_user_password:  os.getenv(env_default_user_password)
		session_secret:         os.getenv(env_session_secret)
		firebird_url:           os.getenv(env_firebird_url)
		redict_url:             os.getenv(env_redict_url)
		debug:                  parse_bool(os.getenv(env_debug))
		port:                   u16(strconv.parse_int(os.getenv(env_port), 10, 64)!)
		cache_duration:         time.second * strconv.parse_int(os.getenv(env_cache_duration),
			10, 64)!
		session_max_age:        time.second * strconv.parse_int(os.getenv(env_session_max_age),
			10, 64)!
		session_refresh_expire: parse_bool(os.getenv(env_session_refresh_expire))
		session_name:           os.getenv(env_session_name)
		session_admin_prefix:   os.getenv(env_session_admin_prefix)
		admin_frontend_url:     os.getenv(env_admin_frontend_url)
		store_frontend_url:     os.getenv(env_store_frotnend_url)
	}

	providers := &peony.Providers{
		blob: peony.new_provider_blob_blobly(blobly_url, blobly_access_key, blobly_secret_key)!
	}

	// You can register your custom veb middleware on app
	mut app := peony.new_peony_app(config, providers)

	app.run()
}
