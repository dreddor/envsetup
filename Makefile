.PHONEY: windows_host windows linux

windows_host: windows ubuntu1804 common

ubuntu1804:
	ansible-playbook ansible/ubuntu1804/*.yaml

windows:
	ansible-playbook ansible/windows/*.yaml

common:
	ansible-playbook ansible/common/*.yaml
