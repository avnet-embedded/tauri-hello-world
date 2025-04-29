# Tauri Hello World

Minimal "Hello World" style Tauri application.

The purpose of this is to be used as a demo of how to build and run a Tauri application in Yocto.
This repo contains only the application source code, not the Yocto recipe(s) which can be found in
https://github.com/avnet-embedded/simplecore-tauri

## Building 'manually'

Usually, the Tauri CLI is used to build the application. However this is not what we want in Yocto,
since it will build and package the app for all supported platforms, introducing dependencies that
are unnecessary for us, since we only target the specific platform that the Yocto build is for.

It's possible to bypass the usual `tauri-cli` build process as follows:

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
./target/release/tauri-hello-world
```

These commands are also wrapped up in the `justfile` for convenience. Note that when using this
approach to build the application, changes in the frontend won't automatically cause the relevant
parts of the Rust application (which embeds the frontend assets) to be rebuilt.

In Yocto this is fine, since a clean build will be performed on any changes within the repo, but it
is something to be aware of if building locally during development (best to use the Taur CLI in
this case).
