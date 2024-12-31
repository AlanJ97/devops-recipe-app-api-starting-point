FROM python:3.9-alpine3.13
LABEL maintainer="londonappdeveloper.com"

ENV PYTHONUNBUFFERED 1

ARG UID=101
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./scripts/run.sh /scripts/run.sh
COPY ./app /app
WORKDIR /app
EXPOSE 8000
ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client jpeg-dev && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev zlib zlib-dev linux-headers && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser \
        --uid $UID \
        --disabled-password \
        --no-create-home \
        django-user && \
    mkdir -p /vol/web/media && \
    mkdir -p /vol/web/static && \
    chown -R django-user:django-user /vol/web && \
    chmod -R 755 /vol/web && \
    chmod -R +x /scripts/run.sh

# Add a separate RUN command to list the contents of /scripts
RUN echo "Listing /scripts directory:" 
# List the contents of /scripts to verify files
RUN echo "Listing /scripts directory:" && ls -l /scripts

RUN echo "Here ends the listing of files in /scripts"

RUN echo "Listing root directory:" && ls -l

RUN echo "Here ends the listing of files in general"

# List the contents of /app to verify files
RUN echo "Listing /app directory:" && ls -l /app

# List files in build context
RUN echo "Files in build context:" && ls -l /

COPY ./requirements.txt /tmp/
RUN echo "Listing /tmp:" && ls -l /tmp

ENV PATH="/scripts:/py/bin:$PATH"

USER django-user

VOLUME /vol/web/media
VOLUME /vol/web/static

CMD ["/scripts/run.sh"]