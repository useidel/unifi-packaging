# unifi-packaging

Some stuff needed to package the [unifi server/controller](https://www.ui.com/download-software/) for Linux. 

The source packages are here -> https://community.ui.com/releases/ 
Search for the term "Unifi Network Application"

So far I have fedora-rpm and deb (Debian and Raspbian)

---

The shell scripts and *.github/workflows/rpmbuild_copr_obs_debbuild_obs.yml* are used for [Github Actions](https://github.com/features/actions) based workflows for automated package creation using [Copr](https://copr.fedorainfracloud.org/coprs/useidel/unifi/) and [Open Build Service](https://build.opensuse.org/package/show/home:useidel/unifictrl), respectively. 
Ideally only the *SPEC file* and *DEB compat file* needs to be updated and the corresponding git push will trigger the automation. 

More generic information about the [Github Actions](https://github.com/features/actions) to [Copr](https://copr.fedorainfracloud.org/) or [OBS](https://build.opensuse.org/) connection can be found [here](https://github.com/useidel/copr_obs-build-test).

