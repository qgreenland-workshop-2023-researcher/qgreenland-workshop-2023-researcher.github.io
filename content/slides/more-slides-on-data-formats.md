---
title: "Additional slides: Geospatial Data Formats and Inspection"
subtitle: "These slides are supplementary material we did not have time to cover in the [Geospatial data formats and metadata inspection](/content/slides/data-formats-and-inspection.html) slides!"
index: 31
background-image: "https://live.staticflickr.com/65535/50238782702_020e861875_k.jpg"
---

# Data Formats

## Comma/Tab Separated Values ([CSV](https://www.loc.gov/preservation/digital/formats/fdd/fdd000323.shtml)/[TSV](https://www.loc.gov/preservation/digital/formats/fdd/fdd000533.shtml))

* General-purpose
    * Use case: vector data
* Highly interoperable
* Lacks metadata support

```{.csv filename="subset_towns_and_settlements.csv"}
name,old_greenlandic,designation,lon,lat
Ittaajimmiit,Igtâjimmiut,settlement,22.32133,70.459295
Nuuk,Nûk,town,51.737382,64.177058
Uunartoq,Ûnarteq,settlement,21.975401,70.414252
```

::: {.notes}
The advantage of CSV is that it's a "lowest common denominator" format that has broad
support. However, lack of metadata support is a deal-breaker for CSV as an interoperable
geospatial information format.

CSV can be fine for _some_ non-geospatial data. Without standardized support for
metadata (e.g. data types) you will sometimes find CSV authors "wing it" and write
metadata into CSV files in non-standard format, e.g. by adding lines to the end
of the file.  [W3 suggests](https://www.w3.org/TR/tabular-data-model/#embedded-metadata)
one method of embedding metadata into a CSV file, but it must be supported by the
processing software.
:::


## [ESRI Shapefile](https://www.loc.gov/preservation/digital/formats/fdd/fdd000280.shtml#factors) {.smaller}

* Vector data
* Lots of downsides:
    * Collection of multiple files
    * Field names limited to 10 characters
    * Limited to 255 fields
    * 2GB size limitation
    * More: <http://switchfromshapefile.org/#shapefileisbad>

```{.default code-line-numbers="false"}
unzip arctic_sea_routes.zip
```

```default
Archive:  arctic_sea_routes.zip
  inflating: Arctic_Sea_Routes.prj
  inflating: Arctic_Sea_Routes.shx
 extracting: Arctic_Sea_Routes.cpg
  inflating: Arctic_Sea_Routes.dbf
  inflating: Arctic_Sea_Routes.shp
```

::: {.notes}
ESRI shapefiles are actually a collection of files stored in a directory (or zip
file). E.g., `.shp`, `.prj`, etc.
:::


# Inspecting  Data

## Learning more about Python tool

The built-in [`help()`](https://docs.python.org/3/library/functions.html#help) function
provides a help page on the given object.

```{.python style="height: 300px"}
>>> import rasterio
>>> help(rasterio)
Help on package rasterio:

NAME
    rasterio - Rasterio

PACKAGE CONTENTS
    _base
    _env
    _err
    _example
    _features
    _filepath
    _fill
    _io
    _path
    _show_versions
    _transform
    _version
    _warp
    control
    coords
    crs
    drivers
    dtypes
    enums
    env
    errors
    features
    fill
    io
    mask
    merge
    path
    plot
    profiles
    rio (package)
    rpc
    sample
    session
    shutil
    tools
    transform
    vrt
    warp
    windows

CLASSES
    builtins.object
        rasterio.crs.CRS
        rasterio.env.Env
    
    class CRS(builtins.object)
     |  CRS(initialdata=None, **kwargs)
     |  A geographic or projected coordinate reference system.
     |  
     |      CRS objects may be created by passing PROJ parameters as keyword
     |      arguments to the standard constructor or by passing EPSG codes, PROJ
     |      mappings, PROJ strings, or WKT strings to the from_epsg, from_dict,
     |      from_string, or from_wkt static methods.
     |  
     |      Examples
     |      --------
     |  
     |      The from_dict method takes PROJ parameters as keyword arguments.
     |  
     |      >>> crs = CRS.from_dict(proj="aea")
     |  
     |      EPSG codes may be used with the from_epsg method.
     |  
     |      >>> crs = CRS.from_epsg(3005)
     |  
     |      The from_string method takes a variety of input.
     |  
     |      >>> crs = CRS.from_string("EPSG:3005")
     |  
     |  Methods defined here:
     |  
     |  __bool__(self, /)
     |      True if self else False
     |  
     |  __copy__(...)
     |      CRS.__copy__(self)
     |  
     |  __eq__(self, value, /)
     |      Return self==value.
     |  
     |  __ge__(self, value, /)
     |      Return self>=value.
     |  
     |  __getitem__(self, key, /)
     |      Return self[key].
     |  
     |  __getstate__(...)
     |      CRS.__getstate__(self)
     |  
     |  __gt__(self, value, /)
     |      Return self>value.
     |  
     |  __hash__(self, /)
     |      Return hash(self).
     |  
     |  __init__(...)
     |      Make a CRS from a PROJ dict or mapping.
     |      
     |      Parameters
     |      ----------
     |      initialdata : mapping, optional
     |          A dictionary or other mapping
     |      kwargs : mapping, optional
     |          Another mapping. Will be overlaid on the initialdata.
     |      
     |      Returns
     |      -------
     |      CRS
     |  
     |  __iter__(self, /)
     |      Implement iter(self).
     |  
     |  __le__(self, value, /)
     |      Return self<=value.
     |  
     |  __len__(self, /)
     |      Return len(self).
     |  
     |  __lt__(self, value, /)
     |      Return self<value.
     |  
     |  __ne__(self, value, /)
     |      Return self!=value.
     |  
     |  __nonzero__ = __bool__(self, /)
     |  
     |  __reduce_cython__(...)
     |      CRS.__reduce_cython__(self)
     |  
     |  __repr__(self, /)
     |      Return repr(self).
     |  
     |  __setstate__(...)
     |      CRS.__setstate__(self, state)
     |  
     |  __setstate_cython__(...)
     |      CRS.__setstate_cython__(self, __pyx_state)
     |  
     |  __str__(self, /)
     |      Return str(self).
     |  
     |  get(...)
     |      CRS.get(self, item)
     |  
     |  items(...)
     |      CRS.items(self)
     |  
     |  to_authority(...)
     |      CRS.to_authority(self, confidence_threshold=70)
     |      Convert to the best match authority name and code.
     |      
     |              For a CRS created using an EPSG code, that same value is
     |              returned.  For other CRS, including custom CRS, an attempt is
     |              made to match it to definitions in authority files.  Matches
     |              with a confidence below the threshold are discarded.
     |      
     |              Parameters
     |              ----------
     |              confidence_threshold : int
     |                  Percent match confidence threshold (0-100).
     |      
     |              Returns
     |              -------
     |              name : str
     |                  Authority name.
     |              code : str
     |                  Code from the authority file.
     |      
     |              or None
     |  
     |  to_dict(...)
     |      CRS.to_dict(self, projjson=False)
     |      Convert CRS to a PROJ dict.
     |      
     |              .. note:: If there is a corresponding EPSG code, it will be used
     |                 when returning PROJ parameter dict.
     |      
     |              .. versionadded:: 1.3.0
     |      
     |              Parameters
     |              ----------
     |              projjson: bool, default=False
     |                  If True, will convert to PROJ JSON dict (Requites GDAL 3.1+
     |                  and PROJ 6.2+).  If False, will convert to PROJ parameter
     |                  dict.
     |      
     |              Returns
     |              -------
     |              dict
     |  
     |  to_epsg(...)
     |      CRS.to_epsg(self, confidence_threshold=70)
     |      Convert to the best match EPSG code.
     |      
     |              For a CRS created using an EPSG code, that same value is
     |              returned.  For other CRS, including custom CRS, an attempt is
     |              made to match it to definitions in the EPSG authority file.
     |              Matches with a confidence below the threshold are discarded.
     |      
     |              Parameters
     |              ----------
     |              confidence_threshold : int
     |                  Percent match confidence threshold (0-100).
     |                 
     |              Returns
     |              -------
     |              int or None
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  to_proj4(...)
     |      CRS.to_proj4(self)
     |      Convert to a PROJ4 representation.
     |      
     |              Returns
     |              -------
     |              str
     |  
     |  to_string(...)
     |      CRS.to_string(self)
     |      Convert to a PROJ4 or WKT string.
     |      
     |              The output will be reduced as much as possible by attempting a
     |              match to CRS defined in authority files.
     |      
     |              Notes
     |              -----
     |              Mapping keys are tested against the ``all_proj_keys`` list.
     |              Values of ``True`` are omitted, leaving the key bare:
     |              {'no_defs': True} -> "+no_defs" and items where the value is
     |              otherwise not a str, int, or float are omitted.
     |      
     |              Returns
     |              -------
     |              str
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  to_wkt(...)
     |      CRS.to_wkt(self, morph_to_esri_dialect=False, version=None)
     |      Convert to a OGC WKT representation.
     |      
     |               .. versionadded:: 1.3.0 version
     |      
     |              Parameters
     |              ----------
     |              morph_to_esri_dialect : bool, optional
     |                  Whether or not to morph to the Esri dialect of WKT Only
     |                  applies to GDAL versions < 3. This parameter will be removed
     |                  in a future version of rasterio.
     |              version : WktVersion or str, optional
     |                  The version of the WKT output.
     |                  Only works with GDAL 3+. Default is WKT1_GDAL.
     |      
     |              Returns
     |              -------
     |              str
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  ----------------------------------------------------------------------
     |  Static methods defined here:
     |  
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate signature.
     |  
     |  from_authority(...)
     |      CRS.from_authority(auth_name, code)
     |      Make a CRS from an authority name and code.
     |      
     |              .. versionadded:: 1.1.7
     |      
     |              Parameters
     |              ----------
     |              auth_name: str
     |                  The name of the authority.
     |              code : int or str
     |                  The code used by the authority.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_dict(...)
     |      CRS.from_dict(initialdata=None, **kwargs)
     |      Make a CRS from a dict of PROJ parameters or PROJ JSON.
     |      
     |              Parameters
     |              ----------
     |              initialdata : mapping, optional
     |                  A dictionary or other mapping
     |              kwargs : mapping, optional
     |                  Another mapping. Will be overlaid on the initialdata.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_epsg(...)
     |      CRS.from_epsg(code)
     |      Make a CRS from an EPSG code.
     |      
     |              Parameters
     |              ----------
     |              code : int or str
     |                  An EPSG code. Strings will be converted to integers.
     |      
     |              Notes
     |              -----
     |              The input code is not validated against an EPSG database.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_proj4(...)
     |      CRS.from_proj4(proj)
     |      Make a CRS from a PROJ4 string.
     |      
     |              Parameters
     |              ----------
     |              proj : str
     |                  A PROJ4 string like "+proj=longlat ..."
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_string(...)
     |      CRS.from_string(value, morph_from_esri_dialect=False)
     |      Make a CRS from an EPSG, PROJ, or WKT string
     |      
     |              Parameters
     |              ----------
     |              value : str
     |                  An EPSG, PROJ, or WKT string.
     |              morph_from_esri_dialect : bool, optional
     |                  If True, items in the input using Esri's dialect of WKT
     |                  will be replaced by OGC standard equivalents.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_user_input(...)
     |      CRS.from_user_input(value, morph_from_esri_dialect=False)
     |      Make a CRS from a variety of inputs.
     |      
     |              Parameters
     |              ----------
     |              value : object
     |                  User input of many different kinds.
     |              morph_from_esri_dialect : bool, optional
     |                  If True, items in the input using Esri's dialect of WKT
     |                  will be replaced by OGC standard equivalents.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_wkt(...)
     |      CRS.from_wkt(wkt, morph_from_esri_dialect=False)
     |      Make a CRS from a WKT string.
     |      
     |              Parameters
     |              ----------
     |              wkt : str
     |                  A WKT string.
     |              morph_from_esri_dialect : bool, optional
     |                  If True, items in the input using Esri's dialect of WKT
     |                  will be replaced by OGC standard equivalents.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  ----------------------------------------------------------------------
     |  Data descriptors defined here:
     |  
     |  data
     |      A PROJ4 dict representation of the CRS.
     |  
     |  is_epsg_code
     |      Test if the CRS is defined by an EPSG code.
     |      
     |      Returns
     |      -------
     |      bool
     |  
     |  is_geographic
     |      Test if the CRS is a geographic coordinate reference system.
     |      
     |      Returns
     |      -------
     |      bool
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  is_projected
     |      Test if the CRS is a projected coordinate reference system.
     |      
     |      Returns
     |      -------
     |      bool
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  is_valid
     |      Test that the CRS is a geographic or projected CRS.
     |      
     |      Returns
     |      -------
     |      bool
     |  
     |  linear_units
     |      Get a short name for the linear units of the CRS.
     |      
     |      Returns
     |      -------
     |      units : str
     |          "m", "ft", etc.
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  linear_units_factor
     |      Get linear units and the conversion factor to meters of the CRS.
     |      
     |      Returns
     |      -------
     |      units : str
     |          "m", "ft", etc.
     |      factor : float
     |          Ratio of one unit to one meter.    
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  units_factor
     |      Get units and the conversion factor of the CRS.
     |      
     |      Returns
     |      -------
     |      units : str
     |          "m", "ft", etc.
     |      factor : float
     |          Ratio of one unit to one radian if the CRS is geographic
     |          otherwise, it is to one meter.
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  wkt
     |      An OGC WKT representation of the CRS
     |      
     |      Returns
     |      -------
     |      str
    
    class Env(builtins.object)
     |  Env(session=None, aws_unsigned=False, profile_name=None, session_class=<function Session.aws_or_dummy at 0x7f52e809e7a0>, **options)
     |  
     |  Abstraction for GDAL and AWS configuration
     |  
     |  The GDAL library is stateful: it has a registry of format drivers,
     |  an error stack, and dozens of configuration options.
     |  
     |  Rasterio's approach to working with GDAL is to wrap all the state
     |  up using a Python context manager (see PEP 343,
     |  https://www.python.org/dev/peps/pep-0343/). When the context is
     |  entered GDAL drivers are registered, error handlers are
     |  configured, and configuration options are set. When the context
     |  is exited, drivers are removed from the registry and other
     |  configurations are removed.
     |  
     |  Example
     |  -------
     |  .. code-block:: python
     |  
     |      with rasterio.Env(GDAL_CACHEMAX=128000000) as env:
     |          # All drivers are registered, GDAL's raster block cache
     |          # size is set to 128 MB.
     |          # Commence processing...
     |          ...
     |          # End of processing.
     |  
     |      # At this point, configuration options are set to their
     |      # previous (possible unset) values.
     |  
     |  A boto3 session or boto3 session constructor arguments
     |  `aws_access_key_id`, `aws_secret_access_key`, `aws_session_token`
     |  may be passed to Env's constructor. In the latter case, a session
     |  will be created as soon as needed. AWS credentials are configured
     |  for GDAL as needed.
     |  
     |  Methods defined here:
     |  
     |  __enter__(self)
     |  
     |  __exit__(self, exc_type=None, exc_val=None, exc_tb=None)
     |  
     |  __init__(self, session=None, aws_unsigned=False, profile_name=None, session_class=<function Session.aws_or_dummy at 0x7f52e809e7a0>, **options)
     |      Create a new GDAL/AWS environment.
     |      
     |      Note: this class is a context manager. GDAL isn't configured
     |      until the context is entered via `with rasterio.Env():`
     |      
     |      Parameters
     |      ----------
     |      session : optional
     |          A Session object.
     |      aws_unsigned : bool, optional
     |          Do not sign cloud requests.
     |      profile_name : str, optional
     |          A shared credentials profile name, as per boto3.
     |      session_class : Session, optional
     |          A sub-class of Session.
     |      **options : optional
     |          A mapping of GDAL configuration options, e.g.,
     |          `CPL_DEBUG=True, CHECK_WITH_INVERT_PROJ=False`.
     |      
     |      Returns
     |      -------
     |      Env
     |      
     |      Notes
     |      -----
     |      We raise EnvError if the GDAL config options
     |      AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY are given. AWS
     |      credentials are handled exclusively by boto3.
     |      
     |      Examples
     |      --------
     |      
     |      >>> with Env(CPL_DEBUG=True, CPL_CURL_VERBOSE=True):
     |      ...     with rasterio.open("https://example.com/a.tif") as src:
     |      ...         print(src.profile)
     |      
     |      For access to secured cloud resources, a Rasterio Session or a
     |      foreign session object may be passed to the constructor.
     |      
     |      >>> import boto3
     |      >>> from rasterio.session import AWSSession
     |      >>> boto3_session = boto3.Session(...)
     |      >>> with Env(AWSSession(boto3_session)):
     |      ...     with rasterio.open("s3://mybucket/a.tif") as src:
     |      ...         print(src.profile)
     |  
     |  credentialize(self)
     |      Get credentials and configure GDAL
     |      
     |      Note well: this method is a no-op if the GDAL environment
     |      already has credentials, unless session is not None.
     |      
     |      Returns
     |      -------
     |      None
     |  
     |  drivers(self)
     |      Return a mapping of registered drivers.
     |  
     |  ----------------------------------------------------------------------
     |  Class methods defined here:
     |  
     |  default_options() from builtins.type
     |      Default configuration options
     |      
     |      Parameters
     |      ----------
     |      None
     |      
     |      Returns
     |      -------
     |      dict
     |  
     |  from_defaults(*args, **kwargs) from builtins.type
     |      Create an environment with default config options
     |      
     |      Parameters
     |      ----------
     |      args : optional
     |          Positional arguments for Env()
     |      kwargs : optional
     |          Keyword arguments for Env()
     |      
     |      Returns
     |      -------
     |      Env
     |      
     |      Notes
     |      -----
     |      The items in kwargs will be overlaid on the default values.
     |  
     |  ----------------------------------------------------------------------
     |  Data descriptors defined here:
     |  
     |  __dict__
     |      dictionary for instance variables (if defined)
     |  
     |  __weakref__
     |      list of weak references to the object (if defined)

FUNCTIONS
    band(ds, bidx)
        A dataset and one or more of its bands
        
        Parameters
        ----------
        ds: dataset object
            An opened rasterio dataset object.
        bidx: int or sequence of ints
            Band number(s), index starting at 1.
        
        Returns
        -------
        rasterio.Band
    
    open(fp, mode='r', driver=None, width=None, height=None, count=None, crs=None, transform=None, dtype=None, nodata=None, sharing=False, **kwargs)
        Open a dataset for reading or writing.
        
        The dataset may be located in a local file, in a resource located by
        a URL, or contained within a stream of bytes.
        
        In read ('r') or read/write ('r+') mode, no keyword arguments are
        required: these attributes are supplied by the opened dataset.
        
        In write ('w' or 'w+') mode, the driver, width, height, count, and dtype
        keywords are strictly required.
        
        Parameters
        ----------
        fp : str, file object, PathLike object, FilePath, or MemoryFile
            A filename or URL, a file object opened in binary ('rb') mode, a
            Path object, or one of the rasterio classes that provides the
            dataset-opening interface (has an open method that returns a
            dataset).
        mode : str, optional
            'r' (read, the default), 'r+' (read/write), 'w' (write), or
            'w+' (write/read).
        driver : str, optional
            A short format driver name (e.g. "GTiff" or "JPEG") or a list of
            such names (see GDAL docs at
            https://gdal.org/drivers/raster/index.html). In 'w' or 'w+' modes
            a single name is required. In 'r' or 'r+' modes the driver can
            usually be omitted. Registered drivers will be tried
            sequentially until a match is found. When multiple drivers are
            available for a format such as JPEG2000, one of them can be
            selected by using this keyword argument.
        width : int, optional
            The number of columns of the raster dataset. Required in 'w' or
            'w+' modes, it is ignored in 'r' or 'r+' modes.
        height : int, optional
            The number of rows of the raster dataset. Required in 'w' or
            'w+' modes, it is ignored in 'r' or 'r+' modes.
        count : int, optional
            The count of dataset bands. Required in 'w' or 'w+' modes, it is
            ignored in 'r' or 'r+' modes.
        crs : str, dict, or CRS; optional
            The coordinate reference system. Required in 'w' or 'w+' modes,
            it is ignored in 'r' or 'r+' modes.
        transform : Affine instance, optional
            Affine transformation mapping the pixel space to geographic
            space. Required in 'w' or 'w+' modes, it is ignored in 'r' or
            'r+' modes.
        dtype : str or numpy dtype
            The data type for bands. For example: 'uint8' or
            ``rasterio.uint16``. Required in 'w' or 'w+' modes, it is
            ignored in 'r' or 'r+' modes.
        nodata : int, float, or nan; optional
            Defines the pixel value to be interpreted as not valid data.
            Required in 'w' or 'w+' modes, it is ignored in 'r' or 'r+'
            modes.
        sharing : bool; optional
            To reduce overhead and prevent programs from running out of file
            descriptors, rasterio maintains a pool of shared low level
            dataset handles. When `True` this function will use a shared
            handle if one is available. Multithreaded programs must avoid
            sharing and should set *sharing* to `False`.
        kwargs : optional
            These are passed to format drivers as directives for creating or
            interpreting datasets. For example: in 'w' or 'w+' modes
            a `tiled=True` keyword argument will direct the GeoTIFF format
            driver to create a tiled, rather than striped, TIFF.
        
        Returns
        -------
        A ``DatasetReader`` or ``DatasetWriter`` object.
        
        Examples
        --------
        
        To open a GeoTIFF for reading using standard driver discovery and
        no directives:
        
        >>> import rasterio
        >>> with rasterio.open('example.tif') as dataset:
        ...     print(dataset.profile)
        
        To open a JPEG2000 using only the JP2OpenJPEG driver:
        
        >>> with rasterio.open(
        ...         'example.jp2', driver='JP2OpenJPEG') as dataset:
        ...     print(dataset.profile)
        
        To create a new 8-band, 16-bit unsigned, tiled, and LZW-compressed
        GeoTIFF with a global extent and 0.5 degree resolution:
        
        >>> from rasterio.transform import from_origin
        >>> with rasterio.open(
        ...         'example.tif', 'w', driver='GTiff', dtype='uint16',
        ...         width=720, height=360, count=8, crs='EPSG:4326',
        ...         transform=from_origin(-180.0, 90.0, 0.5, 0.5),
        ...         nodata=0, tiled=True, compress='lzw') as dataset:
        ...     dataset.write(...)
    
    pad(array, transform, pad_width, mode=None, **kwargs)
        pad array and adjust affine transform matrix.
        
        Parameters
        ----------
        array: ndarray
            Numpy ndarray, for best results a 2D array
        transform: Affine transform
            transform object mapping pixel space to coordinates
        pad_width: int
            number of pixels to pad array on all four
        mode: str or function
            define the method for determining padded values
        
        Returns
        -------
        (array, transform): tuple
            Tuple of new array and affine transform
        
        Notes
        -----
        See numpy docs for details on mode and other kwargs:
        http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.pad.html

DATA
    __all__ = ['band', 'open', 'pad', 'Env', 'CRS']
    __gdal_version__ = '3.6.3'
    __geos_version__ = '3.11.2'
    __proj_version__ = '9.1.1'

VERSION
    1.3.6

FILE
    /home/mfisher/miniconda3/envs/qgreenland-researcher-workshop/lib/python3.11/site-packages/rasterio/__init__.py


```

# Raster data inspection tools


## Raster data inspection: Rasterio CLI

`rio info --help`

``` {.default code-line-numbers="false"}
$ rio info --crs bedmachine_bed.tif
EPSG:3413

$ rio info --dtype bedmachine_bed.tif
float32

$ rio info --nodata bedmachine_bed.tif
-9999.0

$ rio info --shape bedmachine_bed.tif
21876 14844
```

::: {.notes}
Rasterio provides both a CLI and Python interface. We will look at the Python
interface next.
:::


## Raster data inspection: Rasterio Python

`import rasterio; help(rasterio)`

``` {.default code-line-numbers="false"}
python
```

```default
Python 3.11.0 | packaged by conda-forge | (main, Jan 14 2023, 12:27:40) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import rasterio
>>> ds = rasterio.open('bedmachine_bed.tif')
>>> ds.crs
CRS.from_epsg(3413)
>>> ds.dtypes
('float32',)
>>> ds.nodata
-9999.0
>>> ds.shape
(21876, 14844)
>>> ds.close()
```

::: {.notes}
Normally, you would use a context manager to open a file with rasterio. Since
we didn't do that here, we must manually close the file.
:::


## Raster data inspection with Xarray (rioxarray)

`import xarray; help(xarray)`

``` {.default code-line-numbers="false"}
>>> import rioxarray
>>> import xarray as xra
>>> ds = xra.open_dataset('bedmachine_bed.tif')
>>> ds
<xarray.Dataset>
Dimensions:  (band: 1, x: 14844, y: 21876)
Coordinates:
  * band     (band) int64 1
  * x        (x) float64 -9.979e+05 -9.978e+05 ... 1.228e+06 1.228e+06
  * y        (y) float64 -3.298e+05 -3.3e+05 ... -3.611e+06 -3.611e+06
    mapping  int64 ...
Data variables:
    bed      (band, y, x) float32 ...
>>> ds.rio.crs
CRS.from_epsg(3413)
```

::: {.notes}
`rioxarray` provides geospatial awareness to `xarray`.
:::


# Vector data inspection tools

## Vector data inspection: Fiona

_TODO: Verify Fiona is in our JupyterHub environment._

``` {.default code-line-numbers="false"}
python
```

``` {.default code-line-numbers="3-4|5-6|7-8|10-19|20"}
Python 3.11.0 | packaged by conda-forge | (main, Jan 14 2023, 12:27:40) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import fiona
>>> ds = fiona.open('populated_places.gpkg')
>>> ds.profile['crs']
CRS.from_epsg(3413)
>>> ds.profile['driver']
'GPKG'
>>> from pprint import pprint
>>> pprint(ds.profile['schema'])
{'geometry': 'Point',
 'properties': {'Alternative placename': 'str',
                'Authorized': 'str',
                'Authorized date': 'str',
                'Card': 'str',
                'Danish': 'str',
                <... trimmed to save space ...>
                'Translation notes': 'str',
                'label': 'str'}}
>>> ds.close()
```

::: {.notes}
* `profile` attribute contains metadata.
* The "schema" includes geometry type and attribute table fields.
* It's important to either use a context manager or manually close your dataset.
:::

