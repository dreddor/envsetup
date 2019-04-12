.PHONEY: windows_host windows ubuntu1804 restricted

ifeq ($(USERESTRICTED), True)
RESTRICTED_TARGETS = restricted
RESTRICTED_TARGETS_WINDOWS = restricted-windows
endif

RESTRICTED_PATH=../restrictedenv

windows_host: windows $(RESTRICTED_TARGETS_WINDOWS) ubuntu_host

ubuntu_host: ubuntu1804 $(RESTRICTED_TARGETS) common

ubuntu1804:
	ansible-playbook ansible/ubuntu1804/*.yaml

windows:
	ansible-playbook ansible/windows/*.yaml

common:
	ansible-playbook ansible/common/*.yaml

restricted-windows:
	make -C $(RESTRICTED_PATH) windows

restricted:
	make -C $(RESTRICTED_PATH) common

clean:
	rm -r royalts
