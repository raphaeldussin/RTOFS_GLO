#!/bin/bash

if [[ -z "${MACHINE_ID}" ]]; then
    echo "ERROR: MACHINE_ID must be set before sourcing this script."
    return 1 2>/dev/null || exit 1
fi

machine=$(echo "${MACHINE_ID}" | cut -d. -f1)

case "${machine}" in
    "ursa")
        FORCING_ROOT="/scratch4/NCEPDEV/marine/Raphael.Dussin/ERA5/forcing_UFS"
        FORCING_FILE="${FORCING_ROOT}/era5_forcing_y2011m10d01.nc"
        ;;
    "acorn")
        FORCING_FILE="/lfs/h1/emc/couple/noscrub/santha.akella/data/forcing/zg/gfs.2025121400-2025123118_positive.nc"
        ;;
    "wcoss2")
        FORCING_FILE="/lfs/h2/emc/couple/noscrub/santha.akella/data/forcing/zg/gfs.2025121400-2025123118_positive.nc"
        ;;
    "orion" | "hercules")
        FORCING_ROOT="/work/noaa/marine/rdussin/datasets/ERA5/forcing_UFS"
        FORCING_FILE="${FORCING_ROOT}/era5_forcing_y2011m10d01.nc"
        ;;
    *)
        echo "FATAL: Unknown target machine ${machine}"
        return 1 2>/dev/null || exit 1
        ;;
esac

export FORCING_FILE
