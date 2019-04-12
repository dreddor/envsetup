.PHONEY: windows_host windows ubuntu1804 restricted

ifeq ($(USERESTRICTED), True)
RESTRICTED_TARGETS_WINDOWS = restricted-windows
RESTRICTED_TARGETS_UBUNTU1804 = restricted-ubuntu1804
RESTRICTED_TARGETS = restricted
endif

RESTRICTED_PATH=../restrictedenv

windows_host: windows $(RESTRICTED_TARGETS_WINDOWS) ubuntu_host

ubuntu_host: ubuntu1804 $(RESTRICTED_TARGETS_UBUNTU1804) $(RESTRICTED_TARGETS) common

ubuntu1804:
	ansible-playbook ansible/ubuntu1804/*.yaml

windows:
	ansible-playbook ansible/windows/*.yaml

common:
	ansible-playbook ansible/common/*.yaml

restricted-windows:
	make -C $(RESTRICTED_PATH) windows

restricted-ubuntu1804:
	make -C $(RESTRICTED_PATH) ubuntu1804

restricted:
	make -C $(RESTRICTED_PATH) common

clean:
	rm -r royalts
