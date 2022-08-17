# ManageIQ Documentation

[![CI](https://github.com/ManageIQ/manageiq-documentation/actions/workflows/ci.yaml/badge.svg?branch=oparin)](https://github.com/ManageIQ/manageiq-documentation/actions/workflows/ci.yaml)
[![Join the chat at https://gitter.im/ManageIQ/manageiq_docs](https://badges.gitter.im/ManageIQ/manageiq_docs.svg)](https://gitter.im/ManageIQ/manageiq_docs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This documentation site is a [Jekyll](https://github.com/jekyll/jekyll) based site for the ManageIQ documentation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Testing

### Initial set-up (performed once):

1. Create a test directory and proceed into it:    
   `mkdir test && cd test`


2. Clone `manageiq.org` repository:  
   `git clone https://github.com/ManageIQ/manageiq.org manageiq.org`
   

3. Clone `manageiq-documentation` repository:   
   `git clone https://github.com/ManageIQ/manageiq-documentation manageiq-documentation`

   
4. Create local copies of all remote branches in `manageiq-documentation` then checkout `master` branch:    
   `(cd manageiq-documentation && git branch -r --format='%(refname:short)' | sed 's/.*\///;/HEAD/d' | xargs -L 1 -I '{}' git checkout '{}' && git checkout master)`


5. Set the location of the `manageiq-documentation` repository:   
   `export MIQ_REF_REPO="$(readlink -f manageiq-documentation)"`


7. Proceed into the `manageiq-documentation` repository:    
   `cd manageiq-documentation`

### (Re-) Deployment:

1. Submit your changes in the `manageiq-documentation` repository on `master` branch:
   1. Switch to the `master` branch using `git checkout ...` (**be sure not to discard any important data while doing so**).
   2. Edit the documentation files and/or create new files and/or directories.
   3. Update Git-index for modified files using `git add ...` / `git rm ...`
   4. Commit new changes to `master` branch using  `git commit ...`


2. Remove residual build files from the previous builds (if present):   
   `rm -r /tmp/manageiq-documentation`


3. Build the documentation website and deploy to the local server (might take a minute):  
  `(cd ../manageiq.org && exe/miq build reference && exe/miq serve)`


4. Open [this link](http://localhost:4000/docs/reference) in your browser to access the local documentation website contaning your changes.

**Note:** (optional) the static documentation website you've built at this point is located under the `../manageiq.org/dest` directory.    
You can deploy it to an HTTP-server of your choice on current or any other workstation.

## License

<img src="https://camo.githubusercontent.com/5b90073c55c29f75739b4b8f8ec044c82722a41c/687474703a2f2f6d6972726f72732e6372656174697665636f6d6d6f6e732e6f72672f70726573736b69742f627574746f6e732f38387833312f7376672f62792d73612e737667" alt="Creative Commons License" data-canonical-src="http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-sa.svg" height="31px" width="88px">

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
See [LICENSE.txt](LICENSE.txt).
