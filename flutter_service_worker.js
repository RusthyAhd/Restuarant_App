'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ae3a20a7eea8976ba172bb25ac407f48",
"assets/assets/fonts/Inter-Regular.ttf": "eba360005eef21ac6807e45dc8422042",
"assets/assets/fonts/Inter-SemiBold.ttf": "3e87064b7567bef4ecd2ba977ce028bc",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/samples/ui/rive_app/images/logo_email.png": "5fe423ad3604e1dbe76d28abb4e5ff32",
"assets/assets/samples/ui/rive_app/images/logo_google.png": "2b6687b80bdccdf64a6ebccb12aefc80",
"assets/assets/samples/ui/rive_app/images/logo_apple.png": "0076612741142de81e9fb1f30143fa84",
"assets/assets/samples/ui/rive_app/images/icon_lock.png": "6304d0d510c62248bdd66496eda1aa29",
"assets/assets/samples/ui/rive_app/images/icon_email.png": "d51efbd50789a569a1e4a37c261ba1ab",
"assets/assets/samples/ui/rive_app/images/topics/topic_1.png": "39f4beb48bac22f2e10895a831a4e7a6",
"assets/assets/samples/ui/rive_app/images/topics/topic_2.png": "6890179d440608f2f6795e9ee8e6c288",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_4.jpg": "95617f142e8dcfa6547ea80557eee016",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_5.jpg": "405a74c93f4806312fcd25e7722d9f90",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_default.jpg": "fe9d7eaf1b437a1e6c84f1e6fdb77dcf",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_3.jpg": "4431bc261ac4f57a09dc1e041b32b4d1",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_6.jpg": "57b1f154ef47c7a76a78544e9e6af44f",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_1.jpg": "60f969aae689291e30cffc6deafd1ec2",
"assets/assets/samples/ui/rive_app/images/avatars/avatar_2.jpg": "9eecb4a8f2da90198bf8c4f8c3e8c527",
"assets/assets/samples/ui/rive_app/images/backgrounds/spline.png": "ff232f0cf3ebd732ca4383c381450714",
"assets/assets/samples/ui/rive_app/course_rive.png": "d44d0e167f27418546a2d99637026da7",
"assets/assets/samples/ui/rive_app/rive/menu_button.riv": "f8fdfd9fd8dc7873dfac6f005f3233c1",
"assets/assets/samples/ui/rive_app/rive/confetti.riv": "ad0d13cbea799085305316f0e8118274",
"assets/assets/samples/ui/rive_app/rive/button.riv": "c8ffe2900d31d8236247928cd7c2b5f3",
"assets/assets/samples/ui/rive_app/rive/shapes.riv": "8839d67714d5e9c52b3e0dbb2b1e89c1",
"assets/assets/samples/ui/rive_app/rive/check.riv": "14f9269423eabd7e2e10cafdc6ad4d41",
"assets/assets/samples/ui/rive_app/rive/icons.riv": "3d29f9acebef13f01f371b59e84e664b",
"assets/assets/samples/animations/custom_caret.png": "20981f24710cf990547de0fc7afeb02b",
"assets/assets/samples/animations/grid_magnification.png": "41f29b27e0ebe06677eb922e2d0662a9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "fbd224bbd2dd10a4d8a2cf2a79533de1",
"assets/AssetManifest.json": "24d28a40de012adffe2a58e900753199",
"assets/fonts/MaterialIcons-Regular.otf": "7c3176ab7bec23e4d0fbfef6f8050c5e",
"assets/AssetManifest.bin.json": "ce734a8a8817371252befddf3e8c5b17",
"assets/NOTICES": "15d0369386c3e696299f1dbadae7da34",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"version.json": "8d7b7575f25a7211930c53b8d1dd8fc3",
"manifest.json": "6fdd452310e44d3be9ccd98dc2c76904",
"flutter_bootstrap.js": "b62a247b6f2e7cbe9a422350b9e66e69",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"index.html": "6abde9b4cfc7c73d50de0ec37725ca6c",
"/": "6abde9b4cfc7c73d50de0ec37725ca6c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"main.dart.js": "1b901fc8a82eb81b4d567fcadfddf8b6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
