#!/usr/bin/env bash
#
# This script is for use in CryoCloud by workshop attendees. The
# purpose is to sync important data from shared network locations (slower) to
# dedicated local storage (faster). This is important for opening QGIS
# reasonably quickly.
#
# For context, check out these links:
#   * https://github.com/CryoInTheCloud/hub-image/issues/60#issuecomment-1555301928
#   * https://github.com/2i2c-org/infrastructure/issues/2562
set -euo pipefail

# In CryoCloud, `$HOME` is `/home/jovyan`.
# `$HOME/shared/QGreenland` is our read-only storage
QGREENLAND_SHARED_DIR="${HOME}/shared/QGreenland"
# `$HOME/qgis-data` is a 10GB Elastic Block Storage volume dedicated to the
# user
USER_EBS_VOLUME="${HOME}/qgis-data"

QGREENLAND_VERSION="v3.0.0alpha2"
QGREENLAND_PROJECT_NAME="QGreenland_${QGREENLAND_VERSION}"
QGREENLAND_PROJECT_SOURCE_PATH="${QGREENLAND_SHARED_DIR}/${QGREENLAND_PROJECT_NAME}"
QGREENLAND_PROJECT_TARGET_PATH="${USER_EBS_VOLUME}/${QGREENLAND_PROJECT_NAME}"

WORKSHOP_REPO_URL="https://github.com/qgreenland-workshop-2023-researcher/qgreenland-workshop-2023-researcher.github.io.git"
WORKSHOP_REPO_TARGET_PATH="${USER_EBS_VOLUME}/workshop-materials"

DEMO_NOTEBOOK_URL="https://raw.githubusercontent.com/qgreenland-workshop-2023-researcher/qgreenland-workshop-2023-researcher.github.io/main/_notebooks/demo.ipynb"
DEMO_NOTEBOOK_TARGET_PATH="${HOME}/demo.ipynb"


sync_qgreenland() {
    if [ -d "${QGREENLAND_PROJECT_TARGET_PATH}" ]; then
	echo "🎉 QGreenland already exists at '${QGREENLAND_PROJECT_TARGET_PATH}'!"
	echo "    You can trigger a re-download by deleting the above directory and re-running this script."

    else
        if [ ! -d "${QGREENLAND_PROJECT_SOURCE_PATH}" ]; then
            echo "ERROR: Couldn't find QGreenland at '${QGREENLAND_PROJECT_SOURCE_PATH}'"
            exit 1
        fi

        echo "⏱️ Syncing QGreenland to '${USER_EBS_VOLUME}'..."
	rsync -ah "${QGREENLAND_PROJECT_SOURCE_PATH}" "${USER_EBS_VOLUME}"
	echo "🎉 Successfully synced QGreenland to '${USER_EBS_VOLUME}'!"
    fi

}


clone_workshop_repo() {
    if [ -d "${WORKSHOP_REPO_TARGET_PATH}" ]; then
	echo "🎉 Workshop materials already exist at '${WORKSHOP_REPO_TARGET_PATH}'!"
	echo "    You can trigger a re-download by deleting the above directory and re-running this script."
    else
        echo "⏱️ Downloading workshop materials to ${WORKSHOP_REPO_TARGET_PATH}..."
	git clone --quiet "${WORKSHOP_REPO_URL}" "${WORKSHOP_REPO_TARGET_PATH}"
	echo "🎉 Successfully downloaded workshop materials to '${WORKSHOP_REPO_TARGET_PATH}'!"
    fi

    echo "    You can find exercises at '${WORKSHOP_REPO_TARGET_PATH}/content/exercises'."
}

download_demo_notebook_to_homedir() {
    if [ -f "${DEMO_NOTEBOOK_TARGET_PATH}" ]; then
	echo "🎉 Demo notebook already exists at '${DEMO_NOTEBOOK_TARGET_PATH}'!"
	echo "    You can trigger a re-download by deleting the notebook and re-running this script."
    else
        echo "⏱️ Downloading demo notebook ${DEMO_NOTEBOOK_TARGET_PATH}..."
	wget --quiet "${DEMO_NOTEBOOK_URL}" -O "${DEMO_NOTEBOOK_TARGET_PATH}"
	echo "🎉 Successfully downloaded demo notebook to '${DEMO_NOTEBOOK_TARGET_PATH}'!"
    fi
}


sync_qgreenland
clone_workshop_repo
download_demo_notebook_to_homedir
