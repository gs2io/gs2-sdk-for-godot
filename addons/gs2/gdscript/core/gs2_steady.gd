class_name Gs2Steady
extends RefCounted


const CONNECT_TIMEOUT_MS: int = 5 * 1000


static func normalize_steady_endpoint(value) -> String:
    if value == null:
        return ""
    return str(value).strip_edges().rstrip("/")


static func steady_rest_template(steady) -> String:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return ""
    return base + "/{service}"


static func steady_web_socket_url(steady) -> String:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return ""
    var scheme_end = base.find("://")
    if scheme_end == -1:
        return ""
    var scheme = base.substr(0, scheme_end)
    var remainder = base.substr(scheme_end + 3)
    var slash_pos = remainder.find("/")
    var host = remainder if slash_pos == -1 else remainder.substr(0, slash_pos)
    if host == "":
        return ""
    return ("ws" if scheme == "http" else "wss") + "://" + host + "/"


static func is_steady_url(steady, request_url: String) -> bool:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return false
    return request_url == base or request_url.begins_with(base + "/")


static func steady_rest_url(steady, template: String, region: String, request_url: String) -> String:
    var base = normalize_steady_endpoint(steady)
    if base == "":
        return ""
    var resolved = template.replace("{region}", region)
    var service_pos = resolved.find("{service}")
    if service_pos == -1:
        return ""
    var prefix = resolved.substr(0, service_pos)
    var suffix = resolved.substr(service_pos + "{service}".length())
    if not request_url.begins_with(prefix):
        return ""
    var remainder = request_url.substr(prefix.length())
    var service = ""
    var path = ""
    if suffix == "":
        var slash_pos = remainder.find("/")
        service = remainder if slash_pos == -1 else remainder.substr(0, slash_pos)
        path = "" if slash_pos == -1 else remainder.substr(slash_pos)
    else:
        var suffix_pos = remainder.find(suffix)
        if suffix_pos <= 0:
            return ""
        service = remainder.substr(0, suffix_pos)
        path = remainder.substr(suffix_pos + suffix.length())
    if service == "" or service.contains("/"):
        return ""
    return base + "/" + service + path


static func is_connect_failure_status(status: int) -> bool:
    return status == HTTPClient.STATUS_CANT_RESOLVE \
        or status == HTTPClient.STATUS_CANT_CONNECT \
        or status == HTTPClient.STATUS_TLS_HANDSHAKE_ERROR \
        or status == HTTPClient.STATUS_CONNECTION_ERROR
