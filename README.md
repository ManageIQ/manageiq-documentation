# ManageIQ Documentation

[![Build Status](https://travis-ci.org/ManageIQ/manageiq_docs.svg?branch=jansa)](https://travis-ci.org/ManageIQ/manageiq_docs)
[![Gitter](https://badges.gitter.im/ManageIQ/manageiq_docs.svg)](https://gitter.im/ManageIQ/manageiq_docs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

This repo contains the documentation for

* [ManageIQ](http://manageiq.org/)
* [Red Hat CloudForms Management Engine](http://www.redhat.com/en/technologies/cloud-computing/cloudforms/)

## Contributing

The documentation in this repository is built and deployed using [AsciiBinder](http://asciibinder.org).  If you're new to AsciiBinder, head over there and read up on how to contribute documentation.

Documentation follows a [modular-based content model](https://github.com/redhat-documentation/modular-docs), providing a structure for writing and presenting user-story-based documentation. User-story-based documentation attempts to address the reader's needs more than focusing on feature-based documentation. This is accomplished using a set of templates for concepts, references, procedures and assemblies. 

Templates can be found [here](https://github.com/redhat-documentation/modular-docs/tree/master/modular-docs-manual/files). 



### Quick setup

* Be sure to have Ruby installed with the bundler gem (if you don't have bundler, just run `gem install bundler`)
* Clone the manageiq_docs repo.
* `cd` into the new manageiq_docs repo directory.
* `bundle install`
* `bundle exec asciibinder` - This will build the documentation into the _preview directory
* `open _preview/manageiq/master/welcome/index.html`

Alternately, if you want to "live edit" the docs, replace the last two steps with:

* Install the LiveReload browser extension: http://livereload.com/extensions/
* `bundle exec asciibinder watch`
* `open _preview/manageiq/master/welcome/index.html`
* Go to the open page in the browser and enable the LiveReload extension for that page.
* Edit the docs.  When you save, it will auto-build and then the webpage will reload automatically showing your changes.

## Contacts

For questions or comments about the documentation system, try one of the following:

* The [manageiq_docs](https://gitter.im/ManageIQ/manageiq_docs) channel on [Gitter](https://gitter.im).
* The [talk.manageiq.org](http://talk.manageiq.org) forum.

## License

<img src="https://camo.githubusercontent.com/5b90073c55c29f75739b4b8f8ec044c82722a41c/687474703a2f2f6d6972726f72732e6372656174697665636f6d6d6f6e732e6f72672f70726573736b69742f627574746f6e732f38387833312f7376672f62792d73612e737667" alt="Creative Commons License" data-canonical-src="http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-sa.svg" height="31px" width="88px">

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
See [LICENSE.txt](LICENSE.txt).
