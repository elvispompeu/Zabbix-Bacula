![N|Solid](http://www.linuxsysadmin.com.br/wp-content/uploads/2015/08/cropped-linuxsysadmin2.png)
Site: http://www.linuxsysadmin.com.br

# Modo de uso

Edite o /etc/sudoers, e adicione a seguinte linha:
<br>```# vim /etc/sudoers```
<br>```zabbix ALL=NOPASSWD:/sbin/bconsole```

O cominho do bconsole pode estar diferente em diversas distribuições, para descobrir o path correto, execute:
<br>```# which bconsole```

Mova os scripts abaixo para dentro de /etc/zabbix/externalscripts:

 - bacula.backup.size.sh
 - bacula.backup.status.sh
 - bacula.jobname.discovery.sh
 - bacula.volume.gravacao.sh
 - bacula.volume.storage.sh

Após move-los, conceda as devidas permissões:
<br>```chown zabbix. /etc/zabbix/externalscripts/*```
<br>```chmod +x /etc/zabbix/externalscripts/*```

Descomente a linha Include do zabbix_agentd.conf, e adicione o diretório "userparameters":
<br>```# vim /etc/zabbix/zabbix_agentd.conf```
<br>```Include=/etc/zabbix/userparameters/```
<br>```:x!```
<br>```# mkdir /etc/zabbix/userparameters```

Crie o arquivo zabbix.bacula.conf dentro do diretório userparameters e adicione as linhas abaixo:

<br>```# vim /etc/zabbix/userparameters/zabbix.bacula.conf```
```
UserParameter=bacula.jobname.discovery,/etc/zabbix/externalscripts/bacula.jobname.discovery.sh
UserParameter=bacula.volume.gravacao[*],/etc/zabbix/externalscripts/bacula.volume.gravacao.sh $1
UserParameter=bacula.backup.status[*],/etc/zabbix/externalscripts/bacula.backup.status.sh $1
UserParameter=bacula.volume.storage[*],/etc/zabbix/externalscripts/bacula.volume.storage.sh $1
UserParameter=bacula.incremental.size[*],/etc/zabbix/externalscripts/bacula.backup.size.sh incremental $1
UserParameter=bacula.diferencial.size[*],/etc/zabbix/externalscripts/bacula.backup.size.sh diferencial $1
UserParameter=bacula.full.size[*],/etc/zabbix/externalscripts/bacula.backup.size.sh full $1
```
Créditos: Elvis Suffi Pompeu (elvis.pompeu@4linux.com.br / elvis.suffipompeu@hotmail.com) e Alisson Machado (alisson.machado@4linux.com.br)
