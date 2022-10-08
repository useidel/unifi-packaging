# unifi-packaging

Some stuff needed to package the unifi server/controller for Linux. 

The source packages are here -> https://community.ui.com/releases/ 
Search for the term "Unifi Network Application"

So far I have fedora-rpm and deb (Debian and Raspbian)

---

The shell scripts and *.github/workflows/rpmbuild_copr_obs_debbuild_obs.yml* are used for [Github Actions](https://github.com/features/actions) based workflows for automated package creation using [Copr](https://copr.fedorainfracloud.org/coprs/useidel/unifi/) and [Open Build Service](https://build.opensuse.org/package/show/home:useidel/unifictrl), respectively. 
