[docker]
%{ for ip in docker ~}
${ip}
%{ endfor ~}

