.PHONEY: windows_host windows ubuntu1804 restricted

windows_host: windows ubuntu1804 common

ubuntu1804:
	ansible-playbook ansible/ubuntu1804/*.yaml

windows:
	ansible-playbook ansible/windows/*.yaml

common:
	ansible-playbook ansible/common/*.yaml

restricted-windows:
	mkdir -p royalts
	../credstore/credhelper.sh passgetattach "web/Royal TS" code4ward.RoyalTS.Lic.V5.xml > royalts/code4ward.RoyalTS.Lic.V5.xml
	ansible-playbook ansible/restricted/windows.yaml

clean:
	rm -r royalts
