import { PATHS } from "./constants.js";

setActiveNavFromUrl();

function setActiveNavFromUrl() {
    const urlPath = window.location.pathname;

    const secondPathIdx = urlPath.indexOf('/', urlPath.indexOf('/') + 1);
    const thirdPathIdx = urlPath.indexOf('/', secondPathIdx + 1);

    let result;

    if (thirdPathIdx !== -1) {
        result = urlPath.substring(secondPathIdx + 1, thirdPathIdx);
    } else {
        result = urlPath.substring(secondPathIdx + 1);
    }

    result = result.toLowerCase();

    const selectedPath = PATHS[result];

    if (selectedPath) {
        $(document).ready(function () {
            $("#nav-" + selectedPath).addClass("selected");
        })
    }
}

