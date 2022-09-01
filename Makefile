INNO_VERSION=0.1.0
TEMP_DIR=/tmp/terminal-tar
USR_SHARE=deb-struct/usr/share
BUNDLE_DIR=build/linux/x64/release/bundle
MIRRORLIST=${PWD}/build/mirrorlist
deb: 
		mkdir -p ${USR_SHARE}/terminal\
		&& mkdir -p $(USR_SHARE)/applications $(USR_SHARE)/icons/terminal $(USR_SHARE)/terminal $(USR_SHARE)/appdata\
		&& cp -r $(BUNDLE_DIR)/* $(USR_SHARE)/terminal\
		&& cp linux/terminal.desktop $(USR_SHARE)/applications/\
		&& cp linux/com.github.KRTirtho.terminal.appdata.xml $(USR_SHARE)/appdata/terminal.appdata.xml\
		&& cp assets/terminal-logo.png $(USR_SHARE)/icons/terminal\
		&& sed -i 's|com.github.KRTirtho.terminal|terminal|' $(USR_SHARE)/appdata/terminal.appdata.xml\
		&& dpkg-deb -b deb-struct/ build/terminal-linux-x86_64.deb

tar:
		mkdir -p $(TEMP_DIR)\
		&& cp -r $(BUNDLE_DIR)/* $(TEMP_DIR)\
		&& cp linux/terminal.desktop $(TEMP_DIR)\
		&& cp assets/terminal-logo.png $(TEMP_DIR)\
		&& cp linux/com.github.KRTirtho.terminal.appdata.xml $(TEMP_DIR)\
		&& tar -cJf build/terminal-linux-x86_64.tar.xz -C $(TEMP_DIR) .\
		&& rm -rf $(TEMP_DIR)

appimage:
				 appimage-builder --recipe AppImageBuilder.yml\
				 && mv terminal-*-x86_64.AppImage build

aursrcinfo:
					 docker run -e EXPORT_SRC=1 -v ${PWD}/aur-struct:/pkg -v ${MIRRORLIST}:/etc/pacman.d/mirrorlist:ro whynothugo/makepkg

publishaur: 
					 echo '[Warning!]: you need SSH paired with AUR'\
					 && rm -rf build/terminal\
					 && git clone ssh://aur@aur.archlinux.org/terminal-bin.git build/terminal\
					 && cp aur-struct/PKGBUILD aur-struct/.SRCINFO build/terminal\
					 && cd build/terminal\
					 && git add .\
					 && git commit -m "${MSG}"\
					 && git push

innoinstall:
						powershell curl -o build\installer.exe http://files.jrsoftware.org/is/6/innosetup-${INNO_VERSION}.exe
		 				powershell build\installer.exe /verysilent /allusers /dir=build\iscc

inno:
		 powershell .\build\iscc\iscc.exe scripts\windows-setup-creator.iss

choco:
			powershell cp dist\terminal-windows-x86_64-setup.exe choco-struct\tools
			powershell choco pack .\choco-struct\terminal.nuspec  --outputdirectory dist

apk:
		mv build/app/outputs/apk/release/app-release.apk build/terminal-android-all-arch.apk

gensums:
				sh -c scripts/gensums.sh