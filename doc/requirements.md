# Requirements

## 1. Required Applications

+ Install [Python 3+](https://www.python.org/downloads/)
+ Install [GDC Data Transfer Tool Client](https://gdc.cancer.gov/access-data/gdc-data-transfer-tool)

    Get app to download GDC data, download the GDC Data Transfer Tool Client for your system at the above link. Below is an example for Ubuntu.
    ```bash
    curl -O https://gdc.cancer.gov/files/public/file/gdc-client_v1.6.1_Ubuntu_x64.zip
    unzip gdc-client_v1.6.1_Ubuntu_x64.zip
    ```

## 2. Create an environment and install dependencies
```bash
python3 -m venv venv; source venv/bin/activate
```

```bash
pip install -r requirements.txt: pip install -r gdan-tmp-models/requirements.txt 
```

## 3. GDC Client Token
Token setup. Go to https://portal.awg.gdc.cancer.gov/ get token under profile and save as `secrets/gdc-awg.token`

## 4. Fetch Classifier Submodule
Intialize and fetch the submodule *gdan-tmp-models.*

```bash
 git submodule init; git submodule update
```

Make sure to complete each step on the [submodule requirements page](https://github.com/NCICCGPO/gdan-tmp-models/blob/main/doc/requirements.md)

And download required data for submodule under [Download Required Data](https://github.com/NCICCGPO/gdan-tmp-models/blob/main/doc/requirements.md#4-download-required-data)

## 5. Download Required Data

Download these files from the publication page and place in:
+ `src/gdc_download_ref.tar.gz` then `cd src; tar -xf gdc_download_ref.tar.gz`
+ `src/distance_metric/HCMI_AWG_Model-Tumor-Normal_Linkage_v2.0_2.20.2024.txt`
+ `src/processed.tar.gz` then `cd src; tar -xf processed.tar.gz`