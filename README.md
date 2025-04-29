# Tauri Hello World

Minimal Tauri app to help with figuring out how to build and run a Tauri app in Yocto.

## Building 'manually'

It's possible to bypass the usual `tauri-cli` build process, which is likely to be a pain to use as part of a Yocto build.

```
# In top-level source directory, build the frontend
# The build outputs go in the `./dist` folder (but this can be called anything as long as it's specified in the tauri.conf.json)
npm run build

# In the Rust source directory (one level down from top level dir), do a cargo build
# The tauri "custom-protocol" feature must be set, otherwise the resulting binary will have a "could not connect to localhost" error,
# since it seems to assume a development server is running.
cd src-tauri
cargo build --release --features tauri/custom-protocol

# The built binary ends up in `./target/release` as normal
./target/release/app
```

These commands are also wrapped up in the `justfile` for convenience.
