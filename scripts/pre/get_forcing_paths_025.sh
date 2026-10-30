#!/bin/bash

if [[ -z "${MACHINE_ID}" ]]; then
    echo "ERROR: MACHINE_ID must be set before sourcing this script."
    return 1 2>/dev/null || exit 1
fi

machine=$(echo "${MACHINE_ID}" | cut -d. -f1)

case "${machine}" in
    "wcoss2" | "acorn")
        FORCING_ROOT="/lfs/h2/emc/nems/noscrub/emc.nems/RT/NEMSfv3gfs/input-data-20260617"
        FORCING_FILE="${FORCING_ROOT}/DATM_CDEPS/GEFS_NEW/201110/gefs.201110.nc"
        ;;
    "orion" | "hercules")
	FORCING_ROOT="/work/noaa/marine/rdussin/datasets/ERA5/forcing_UFS"
        FORCING_FILE="${FORCING_ROOT}/era5_forcing_y2011m10d01.nc"
        ;;
    "ursa")
        FORCING_ROOT="/scratch4/NCEPDEV/marine/Raphael.Dussin/ERA5/forcing_UFS"
        FORCING_FILE="${FORCING_ROOT}/era5_forcing_y2011m10d01.nc"
        ;;
    *)
        echo "FATAL: Unknown target machine ${machine}"
        echo "couldn't set INPUTDATA_ROOT and FORCING_FILE"
        return 1 2>/dev/null || exit 1
        ;;
esac

export INPUTDATA_ROOT FORCING_FILE
