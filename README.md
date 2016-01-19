Assignment1 - Flicks is a movies viewer application for iOS.

Submitted by: Davis Guohua Xie

User Stories

The following required functionality is complete:

[X] User can view a list of movies currently playing in theaters from The Movie Database.

[X]Poster images are loaded using the UIImageView category in the AFNetworking library.

[X]The movie poster is available by appending the returned poster_path to https://image.tmdb.org/t/p/w342.

[X]User sees a loading state while waiting for the movies API. You can use one of the 3rd party libraries listed on CocoaControls.

[X]User can pull to refresh the movie list.

The following optional features are implemented:

[x] User sees an error message when there's a networking error. You may not use UIAlertController or a 3rd party library to display the error. See this screenshot for what the error message should look like. Hint: Using the hidden property of a view can be helpful to toggle the network error view's visibility. (This app implemented some codes from Isuru Nanayakkara: Reach.swift)

[x]Movies are displayed using a CollectionView instead of a TableView.

[ ]User can search for a movie. Hint: Consider using a UISearchBar for this feature. Don't use the UISearchDisplayController.

[ ]All images fade in as they are loading: Hint: Use the - (void)setImageWithURLRequest:(NSURLRequest *)urlRequest method in AFNetworking. Create an additional category method that has a success block that fades in the image. The image should only fade in if it's coming from network, not cache.

[x]Customize the UI. You can use Iconmonstr and The Noun Project as good sources of images.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://media.giphy.com/media/3o7rc4PBC6jSvDZ89a/giphy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />ideo Walkthrough

GIF created with LiceCap.

Notes

Describe any challenges encountered while building the app.

License

Copyright [2015] [Davis Guohua Xie]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
