from urllib.parse import urlparse


def get_url_path(url, strip_leading_slash=True):
    path = str(urlparse(url).path)
    if strip_leading_slash:
        return path.lstrip("/")
    return path


def join_url(*parts, append_trailing_slash=True):
    url = "/".join([str(part).strip("/") for part in parts])
    if append_trailing_slash:
        url = url + "/"
    return url
