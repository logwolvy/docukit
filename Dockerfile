FROM ubuntu:focal

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
