<!--
Tomato GUI
Copyright (C) 2007-2011 Shibby
http://openlinksys.info
For use with Tomato Firmware only.
No part of this file may be used without permission.
--><title>SNMP Settings</title>
<content>
	<script type="text/javascript">
		//	<% nvram("at_update,tomatoanon_answer,snmp_enable,snmp_port,snmp_remote,snmp_remote_sip,snmp_location,snmp_contact,snmp_ro"); %>

		function verifyFields(focused, quiet)
		{
			var ok = 1;

			var a = E('_f_snmp_enable').checked;

			E('_snmp_port').disabled = !a;
			E('_f_snmp_remote').disabled = !a;
			E('_snmp_remote_sip').disabled = !a;
			E('_snmp_location').disabled = !a;
			E('_snmp_contact').disabled = !a;
			E('_snmp_ro').disabled = !a;
			E('_snmp_remote_sip').disabled = (!a || !E('_f_snmp_remote').checked);

			return ok;
		}

		function save()
		{
			if (verifyFields(null, 0)==0) return;
			var fom = E('_fom');
			fom.snmp_enable.value = E('_f_snmp_enable').checked ? 1 : 0;
			fom.snmp_remote.value = E('_f_snmp_remote').checked ? 1 : 0;

			if (fom.snmp_enable.value == 0) {
				fom._service.value = 'snmp-stop';
			}
			else {
				fom._service.value = 'snmp-restart,firewall-restart'; 
			}
			form.submit('_fom', 1);
		}

	</script>
	<div class="section" id="config-section">
		<form id="_fom" method="post" action="tomato.cgi">
		<input type="hidden" name="_nextpage" value="/#admin-snmp.asp">
		<input type="hidden" name="_service" value="snmp-restart,firewall-restart">
		<input type="hidden" name="snmp_enable">
		<input type="hidden" name="snmp_remote">

		<script type="text/javascript">
			createFieldTable('', [
				{ title: 'Enable SNMP', name: 'f_snmp_enable', type: 'checkbox', value: nvram.snmp_enable == '1' },
				{ title: 'Port', indent: 2, name: 'snmp_port', type: 'text', maxlen: 5, size: 7, value: fixPort(nvram.snmp_port, 161) },
				{ title: 'Remote', indent: 2, name: 'f_snmp_remote', type: 'checkbox', value: nvram.snmp_remote == '1' },
				{ title: 'Allowed Remote<br>IP Address', indent: 3, name: 'snmp_remote_sip', type: 'text', maxlen: 512, size: 64, value: nvram.snmp_remote_sip,
					suffix: '<br><small>(optional; ex: "1.1.1.1", "1.1.1.0/24", "1.1.1.1 - 2.2.2.2" or "me.example.com")</small>' },
				null,
				{ title: 'Location', indent: 2, name: 'snmp_location', type: 'text', maxlen: 20, size: 25, value: nvram.snmp_location },
				{ title: 'Contact', indent: 2, name: 'snmp_contact', type: 'text', maxlen: 20, size: 25, value: nvram.snmp_contact },
				{ title: 'RO Community', indent: 2, name: 'snmp_ro', type: 'text', maxlen: 20, size: 25, value: nvram.snmp_ro }
				], '#config-section', 'fields-table');
		</script>
	</div>
	</form>

	<button type="button" value="Save" id="save-button" onclick="save()" class="btn btn-primary">Save <i class="icon-check"></i></button>
	<button type="button" value="Cancel" id="cancel-button" onclick="javascript:reloadPage();" class="btn">Cancel <i class="icon-cancel"></i></button>
	&nbsp; <span id="footer-msg" class="alert warning" style="visibility: hidden;"></span>

	<script type="text/javascript">verifyFields(null, 1);</script>
</content>