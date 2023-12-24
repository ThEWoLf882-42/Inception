# FROM alpine:3.19.0

# ARG FTP_USR \
# 	FTP_PWD

# RUN apk update && apk upgrade && \
# 	apk add --no-cache vsftpd

# RUN adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
# 	echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
# 	adduser ${FTP_USR} root

# RUN sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
# 	sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
# 	sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
# 	sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf

# RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
# 	echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
# 	echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

# WORKDIR /var/www

# RUN chown -R ${FTP_USR}:${FTP_USR} /var/www

# EXPOSE 21

# CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]

FROM alpine:3.19.0

ARG FTP_USR
ARG FTP_PWD

RUN apk update && apk upgrade && \
	apk add --no-cache vsftpd openssl

# Create SSL certificate and key for enabling FTPS
RUN openssl req -x509 -nodes -days 365 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

RUN adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
	echo "${FTP_USR}:${FTP_PWD}" /usr/sbin/chpasswd && \
	adduser ${FTP_USR} root

# Edit the vsftpd configuration
RUN sed -i "schroot_local_user=YESchroot_local_user=YESg"  /etc/vsftpd/vsftpd.conf && \
	sed -i "slocal_enable=YESlocal_enable=YESg"  /etc/vsftpd/vsftpd.conf && \
	sed -i "swrite_enable=YESwrite_enable=YESg"  /etc/vsftpd/vsftpd.conf && \
	sed -i "slocal_umask=022local_umask=007g"  /etc/vsftpd/vsftpd.conf

RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
	echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	# Enable SSL/TLS configurations below
	echo "ssl_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "allow_anon_ssl=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "force_local_data_ssl=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "force_local_logins_ssl=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "ssl_tlsv1=YES" >> /etc/vsftpd/vsftpd.conf && \
	echo "ssl_sslv2=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "ssl_sslv3=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "require_ssl_reuse=NO" >> /etc/vsftpd/vsftpd.conf && \
	echo "ssl_ciphers=HIGH" >> /etc/vsftpd/vsftpd.conf && \
	echo "rsa_cert_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf && \
	echo "rsa_private_key_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf

WORKDIR /var/www

RUN chown -R ${FTP_USR}:${FTP_USR} /var/www

EXPOSE 21

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]