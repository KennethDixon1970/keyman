#
# engine installation builder Makefile
#

!include ..\..\Defines.mak

# ----------------------------------------------------------------------

setup: msm copy

build:
    cd $(ROOT)\src\engine\inst\insthelper
    $(MAKE) build

signcode:
    cd $(ROOT)\src\engine\inst\insthelper
    $(MAKE) signcode

backup:
    cd $(ROOT)\src\engine\inst\insthelper
    $(MAKE) backup

msm: 
    #
    # Copy files for installation
    #

    $(PROGRAM)\buildtools\mkver -v -u download.in download.mak $(ROOT)\src\developer\version.txt

    #
    # Make the installation archive
    #

    $(MAKE) -fdownload.mak prepareredist
    $(MAKE) -fdownload.mak candle
    
    # warning 1072 relates to Error table defined by WixUtilExtension. Doesn't really affect us.
    $(WIXLIGHT) -sw1072 -ext WixUtilExtension keymanengine.wixobj components.wixobj -o keymanengine.msm

copy:    
    #
    # Sign the installation archive
    #

    cd $(ROOT)\src\engine\inst
    $(SIGNCODE) /d "Keyman Engine" keymanengine.msm

    #
    # Copy the installation archive
    #

    cd $(ROOT)\src\engine\inst
    copy $(ROOT)\src\engine\inst\keymanengine.msm $(ROOT)\bin\developer\wix
    $(MAKE) -fdownload.mak copyredist

clean:
    cd $(ROOT)\src\engine\inst\insthelper
    $(MAKE) clean
    cd $(ROOT)\src\engine\inst
    if exist download.mak $(MAKE) -fdownload.mak clean
    -del /Q download.mak
    -del /Q *.msm
    -del /Q *.wixobj
    -del /Q *.wixpdb

install:
    rem nothing

# ----------------------------------------------------------------------

!include ..\..\Target.mak

# ----------------------------------------------------------------------
# EOF
# ----------------------------------------------------------------------
	