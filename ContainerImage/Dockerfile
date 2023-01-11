FROM bibletranslationtools/appbuilder:old-base
COPY home/sab-run-build.sh /root/sab-run-build.sh
RUN chmod +x /root/sab-run-build.sh
WORKDIR /root
ENTRYPOINT [ "/root/sab-run-build.sh" ]
