FROM nginx

COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
