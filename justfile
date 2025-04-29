build:
	npm run build
	cd src-tauri && cargo build --release --features tauri/custom-protocol --features tauri/devtools

run:
	./src-tauri/target/release/tauri-hello-world

clean:
	rm -rf dist
	rm -rf src-tauri/target
