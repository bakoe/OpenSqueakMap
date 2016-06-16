as yet unclassified
show: aPoint at: aZoomLevel

	| osm progressBar |
	osm := self new viewport: (OSMViewport on: aPoint at: aZoomLevel).
	osm overlay: (OSMOverlay withBounds: (osm viewport bounds) on: osm viewport).
	osm viewport addMorph: osm overlay.
	progressBar := ProgressMorph new.
	progressBar center: osm viewport center.
	osm viewport addMorph: progressBar.
	osm chunkManager didChangeOn: osm viewport progress: progressBar.
	progressBar delete.
	^ osm.