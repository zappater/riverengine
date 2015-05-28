#lang racket
(require racket/gui/base)
(require "textureclass.rkt")
(provide (all-defined-out))

;new textures 
(define 50x50_stratagus_tileset384 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (384).png")] 
 [name "50x50_stratagus_tileset384"])) 
(define 50x50_stratagus_tileset383 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (383).png")] 
 [name "50x50_stratagus_tileset383"])) 
(define 50x50_stratagus_tileset382 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (382).png")] 
 [name "50x50_stratagus_tileset382"])) 
(define 50x50_stratagus_tileset381 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (381).png")] 
 [name "50x50_stratagus_tileset381"])) 
(define 50x50_stratagus_tileset380 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (380).png")] 
 [name "50x50_stratagus_tileset380"])) 
(define 50x50_stratagus_tileset379 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (379).png")] 
 [name "50x50_stratagus_tileset379"])) 
(define 50x50_stratagus_tileset378 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (378).png")] 
 [name "50x50_stratagus_tileset378"])) 
(define 50x50_stratagus_tileset377 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (377).png")] 
 [name "50x50_stratagus_tileset377"])) 
(define 50x50_stratagus_tileset376 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (376).png")] 
 [name "50x50_stratagus_tileset376"])) 
(define 50x50_stratagus_tileset375 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (375).png")] 
 [name "50x50_stratagus_tileset375"])) 
(define 50x50_stratagus_tileset374 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (374).png")] 
 [name "50x50_stratagus_tileset374"])) 
(define 50x50_stratagus_tileset373 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (373).png")] 
 [name "50x50_stratagus_tileset373"])) 
(define 50x50_stratagus_tileset372 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (372).png")] 
 [name "50x50_stratagus_tileset372"])) 
(define 50x50_stratagus_tileset371 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (371).png")] 
 [name "50x50_stratagus_tileset371"])) 
(define 50x50_stratagus_tileset370 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (370).png")] 
 [name "50x50_stratagus_tileset370"])) 
(define 50x50_stratagus_tileset369 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (369).png")] 
 [name "50x50_stratagus_tileset369"])) 
(define 50x50_stratagus_tileset368 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (368).png")] 
 [name "50x50_stratagus_tileset368"])) 
(define 50x50_stratagus_tileset367 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (367).png")] 
 [name "50x50_stratagus_tileset367"])) 
(define 50x50_stratagus_tileset366 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (366).png")] 
 [name "50x50_stratagus_tileset366"])) 
(define 50x50_stratagus_tileset365 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (365).png")] 
 [name "50x50_stratagus_tileset365"])) 
(define 50x50_stratagus_tileset364 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (364).png")] 
 [name "50x50_stratagus_tileset364"])) 
(define 50x50_stratagus_tileset363 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (363).png")] 
 [name "50x50_stratagus_tileset363"])) 
(define 50x50_stratagus_tileset362 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (362).png")] 
 [name "50x50_stratagus_tileset362"])) 
(define 50x50_stratagus_tileset361 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (361).png")] 
 [name "50x50_stratagus_tileset361"])) 
(define 50x50_stratagus_tileset360 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (360).png")] 
 [name "50x50_stratagus_tileset360"])) 
(define 50x50_stratagus_tileset359 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (359).png")] 
 [name "50x50_stratagus_tileset359"])) 
(define 50x50_stratagus_tileset358 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (358).png")] 
 [name "50x50_stratagus_tileset358"])) 
(define 50x50_stratagus_tileset357 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (357).png")] 
 [name "50x50_stratagus_tileset357"])) 
(define 50x50_stratagus_tileset356 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (356).png")] 
 [name "50x50_stratagus_tileset356"])) 
(define 50x50_stratagus_tileset355 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (355).png")] 
 [name "50x50_stratagus_tileset355"])) 
(define 50x50_stratagus_tileset354 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (354).png")] 
 [name "50x50_stratagus_tileset354"])) 
(define 50x50_stratagus_tileset353 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (353).png")] 
 [name "50x50_stratagus_tileset353"])) 
(define 50x50_stratagus_tileset352 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (352).png")] 
 [name "50x50_stratagus_tileset352"])) 
(define 50x50_stratagus_tileset351 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (351).png")] 
 [name "50x50_stratagus_tileset351"])) 
(define 50x50_stratagus_tileset350 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (350).png")] 
 [name "50x50_stratagus_tileset350"])) 
(define 50x50_stratagus_tileset349 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (349).png")] 
 [name "50x50_stratagus_tileset349"])) 
(define 50x50_stratagus_tileset348 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (348).png")] 
 [name "50x50_stratagus_tileset348"])) 
(define 50x50_stratagus_tileset347 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (347).png")] 
 [name "50x50_stratagus_tileset347"])) 
(define 50x50_stratagus_tileset346 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (346).png")] 
 [name "50x50_stratagus_tileset346"])) 
(define 50x50_stratagus_tileset345 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (345).png")] 
 [name "50x50_stratagus_tileset345"])) 
(define 50x50_stratagus_tileset344 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (344).png")] 
 [name "50x50_stratagus_tileset344"])) 
(define 50x50_stratagus_tileset343 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (343).png")] 
 [name "50x50_stratagus_tileset343"])) 
(define 50x50_stratagus_tileset342 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (342).png")] 
 [name "50x50_stratagus_tileset342"])) 
(define 50x50_stratagus_tileset341 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (341).png")] 
 [name "50x50_stratagus_tileset341"])) 
(define 50x50_stratagus_tileset340 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (340).png")] 
 [name "50x50_stratagus_tileset340"])) 
(define 50x50_stratagus_tileset339 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (339).png")] 
 [name "50x50_stratagus_tileset339"])) 
(define 50x50_stratagus_tileset338 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (338).png")] 
 [name "50x50_stratagus_tileset338"])) 
(define 50x50_stratagus_tileset337 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (337).png")] 
 [name "50x50_stratagus_tileset337"])) 
(define 50x50_stratagus_tileset336 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (336).png")] 
 [name "50x50_stratagus_tileset336"])) 
(define 50x50_stratagus_tileset335 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (335).png")] 
 [name "50x50_stratagus_tileset335"])) 
(define 50x50_stratagus_tileset334 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (334).png")] 
 [name "50x50_stratagus_tileset334"])) 
(define 50x50_stratagus_tileset333 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (333).png")] 
 [name "50x50_stratagus_tileset333"])) 
(define 50x50_stratagus_tileset332 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (332).png")] 
 [name "50x50_stratagus_tileset332"])) 
(define 50x50_stratagus_tileset331 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (331).png")] 
 [name "50x50_stratagus_tileset331"])) 
(define 50x50_stratagus_tileset330 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (330).png")] 
 [name "50x50_stratagus_tileset330"])) 
(define 50x50_stratagus_tileset329 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (329).png")] 
 [name "50x50_stratagus_tileset329"])) 
(define 50x50_stratagus_tileset328 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (328).png")] 
 [name "50x50_stratagus_tileset328"])) 
(define 50x50_stratagus_tileset327 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (327).png")] 
 [name "50x50_stratagus_tileset327"])) 
(define 50x50_stratagus_tileset326 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (326).png")] 
 [name "50x50_stratagus_tileset326"])) 
(define 50x50_stratagus_tileset325 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (325).png")] 
 [name "50x50_stratagus_tileset325"])) 
(define 50x50_stratagus_tileset324 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (324).png")] 
 [name "50x50_stratagus_tileset324"])) 
(define 50x50_stratagus_tileset323 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (323).png")] 
 [name "50x50_stratagus_tileset323"])) 
(define 50x50_stratagus_tileset322 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (322).png")] 
 [name "50x50_stratagus_tileset322"])) 
(define 50x50_stratagus_tileset321 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (321).png")] 
 [name "50x50_stratagus_tileset321"])) 
(define 50x50_stratagus_tileset320 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (320).png")] 
 [name "50x50_stratagus_tileset320"])) 
(define 50x50_stratagus_tileset319 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (319).png")] 
 [name "50x50_stratagus_tileset319"])) 
(define 50x50_stratagus_tileset318 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (318).png")] 
 [name "50x50_stratagus_tileset318"])) 
(define 50x50_stratagus_tileset317 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (317).png")] 
 [name "50x50_stratagus_tileset317"])) 
(define 50x50_stratagus_tileset316 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (316).png")] 
 [name "50x50_stratagus_tileset316"])) 
(define 50x50_stratagus_tileset315 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (315).png")] 
 [name "50x50_stratagus_tileset315"])) 
(define 50x50_stratagus_tileset314 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (314).png")] 
 [name "50x50_stratagus_tileset314"])) 
(define 50x50_stratagus_tileset313 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (313).png")] 
 [name "50x50_stratagus_tileset313"])) 
(define 50x50_stratagus_tileset312 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (312).png")] 
 [name "50x50_stratagus_tileset312"])) 
(define 50x50_stratagus_tileset311 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (311).png")] 
 [name "50x50_stratagus_tileset311"])) 
(define 50x50_stratagus_tileset310 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (310).png")] 
 [name "50x50_stratagus_tileset310"])) 
(define 50x50_stratagus_tileset309 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (309).png")] 
 [name "50x50_stratagus_tileset309"])) 
(define 50x50_stratagus_tileset308 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (308).png")] 
 [name "50x50_stratagus_tileset308"])) 
(define 50x50_stratagus_tileset307 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (307).png")] 
 [name "50x50_stratagus_tileset307"])) 
(define 50x50_stratagus_tileset306 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (306).png")] 
 [name "50x50_stratagus_tileset306"])) 
(define 50x50_stratagus_tileset305 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (305).png")] 
 [name "50x50_stratagus_tileset305"])) 
(define 50x50_stratagus_tileset304 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (304).png")] 
 [name "50x50_stratagus_tileset304"])) 
(define 50x50_stratagus_tileset303 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (303).png")] 
 [name "50x50_stratagus_tileset303"])) 
(define 50x50_stratagus_tileset302 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (302).png")] 
 [name "50x50_stratagus_tileset302"])) 
(define 50x50_stratagus_tileset301 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (301).png")] 
 [name "50x50_stratagus_tileset301"])) 
(define 50x50_stratagus_tileset300 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (300).png")] 
 [name "50x50_stratagus_tileset300"])) 
(define 50x50_stratagus_tileset299 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (299).png")] 
 [name "50x50_stratagus_tileset299"])) 
(define 50x50_stratagus_tileset298 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (298).png")] 
 [name "50x50_stratagus_tileset298"])) 
(define 50x50_stratagus_tileset297 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (297).png")] 
 [name "50x50_stratagus_tileset297"])) 
(define 50x50_stratagus_tileset296 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (296).png")] 
 [name "50x50_stratagus_tileset296"])) 
(define 50x50_stratagus_tileset295 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (295).png")] 
 [name "50x50_stratagus_tileset295"])) 
(define 50x50_stratagus_tileset294 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (294).png")] 
 [name "50x50_stratagus_tileset294"])) 
(define 50x50_stratagus_tileset293 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (293).png")] 
 [name "50x50_stratagus_tileset293"])) 
(define 50x50_stratagus_tileset292 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (292).png")] 
 [name "50x50_stratagus_tileset292"])) 
(define 50x50_stratagus_tileset291 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (291).png")] 
 [name "50x50_stratagus_tileset291"])) 
(define 50x50_stratagus_tileset290 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (290).png")] 
 [name "50x50_stratagus_tileset290"])) 
(define 50x50_stratagus_tileset289 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (289).png")] 
 [name "50x50_stratagus_tileset289"])) 
(define 50x50_stratagus_tileset288 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (288).png")] 
 [name "50x50_stratagus_tileset288"])) 
(define 50x50_stratagus_tileset287 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (287).png")] 
 [name "50x50_stratagus_tileset287"])) 
(define 50x50_stratagus_tileset286 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (286).png")] 
 [name "50x50_stratagus_tileset286"])) 
(define 50x50_stratagus_tileset285 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (285).png")] 
 [name "50x50_stratagus_tileset285"])) 
(define 50x50_stratagus_tileset284 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (284).png")] 
 [name "50x50_stratagus_tileset284"])) 
(define 50x50_stratagus_tileset283 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (283).png")] 
 [name "50x50_stratagus_tileset283"])) 
(define 50x50_stratagus_tileset282 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (282).png")] 
 [name "50x50_stratagus_tileset282"])) 
(define 50x50_stratagus_tileset281 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (281).png")] 
 [name "50x50_stratagus_tileset281"])) 
(define 50x50_stratagus_tileset280 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (280).png")] 
 [name "50x50_stratagus_tileset280"])) 
(define 50x50_stratagus_tileset279 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (279).png")] 
 [name "50x50_stratagus_tileset279"])) 
(define 50x50_stratagus_tileset278 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (278).png")] 
 [name "50x50_stratagus_tileset278"])) 
(define 50x50_stratagus_tileset277 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (277).png")] 
 [name "50x50_stratagus_tileset277"])) 
(define 50x50_stratagus_tileset276 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (276).png")] 
 [name "50x50_stratagus_tileset276"])) 
(define 50x50_stratagus_tileset275 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (275).png")] 
 [name "50x50_stratagus_tileset275"])) 
(define 50x50_stratagus_tileset274 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (274).png")] 
 [name "50x50_stratagus_tileset274"])) 
(define 50x50_stratagus_tileset273 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (273).png")] 
 [name "50x50_stratagus_tileset273"])) 
(define 50x50_stratagus_tileset272 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (272).png")] 
 [name "50x50_stratagus_tileset272"])) 
(define 50x50_stratagus_tileset271 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (271).png")] 
 [name "50x50_stratagus_tileset271"])) 
(define 50x50_stratagus_tileset270 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (270).png")] 
 [name "50x50_stratagus_tileset270"])) 
(define 50x50_stratagus_tileset269 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (269).png")] 
 [name "50x50_stratagus_tileset269"])) 
(define 50x50_stratagus_tileset268 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (268).png")] 
 [name "50x50_stratagus_tileset268"])) 
(define 50x50_stratagus_tileset267 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (267).png")] 
 [name "50x50_stratagus_tileset267"])) 
(define 50x50_stratagus_tileset266 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (266).png")] 
 [name "50x50_stratagus_tileset266"])) 
(define 50x50_stratagus_tileset265 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (265).png")] 
 [name "50x50_stratagus_tileset265"])) 
(define 50x50_stratagus_tileset264 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (264).png")] 
 [name "50x50_stratagus_tileset264"])) 
(define 50x50_stratagus_tileset263 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (263).png")] 
 [name "50x50_stratagus_tileset263"])) 
(define 50x50_stratagus_tileset262 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (262).png")] 
 [name "50x50_stratagus_tileset262"])) 
(define 50x50_stratagus_tileset261 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (261).png")] 
 [name "50x50_stratagus_tileset261"])) 
(define 50x50_stratagus_tileset260 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (260).png")] 
 [name "50x50_stratagus_tileset260"])) 
(define 50x50_stratagus_tileset259 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (259).png")] 
 [name "50x50_stratagus_tileset259"])) 
(define 50x50_stratagus_tileset258 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (258).png")] 
 [name "50x50_stratagus_tileset258"])) 
(define 50x50_stratagus_tileset257 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (257).png")] 
 [name "50x50_stratagus_tileset257"])) 
(define 50x50_stratagus_tileset256 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (256).png")] 
 [name "50x50_stratagus_tileset256"])) 
(define 50x50_stratagus_tileset255 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (255).png")] 
 [name "50x50_stratagus_tileset255"])) 
(define 50x50_stratagus_tileset254 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (254).png")] 
 [name "50x50_stratagus_tileset254"])) 
(define 50x50_stratagus_tileset253 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (253).png")] 
 [name "50x50_stratagus_tileset253"])) 
(define 50x50_stratagus_tileset252 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (252).png")] 
 [name "50x50_stratagus_tileset252"])) 
(define 50x50_stratagus_tileset251 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (251).png")] 
 [name "50x50_stratagus_tileset251"])) 
(define 50x50_stratagus_tileset250 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (250).png")] 
 [name "50x50_stratagus_tileset250"])) 
(define 50x50_stratagus_tileset249 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (249).png")] 
 [name "50x50_stratagus_tileset249"])) 
(define 50x50_stratagus_tileset248 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (248).png")] 
 [name "50x50_stratagus_tileset248"])) 
(define 50x50_stratagus_tileset247 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (247).png")] 
 [name "50x50_stratagus_tileset247"])) 
(define 50x50_stratagus_tileset246 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (246).png")] 
 [name "50x50_stratagus_tileset246"])) 
(define 50x50_stratagus_tileset245 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (245).png")] 
 [name "50x50_stratagus_tileset245"])) 
(define 50x50_stratagus_tileset244 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (244).png")] 
 [name "50x50_stratagus_tileset244"])) 
(define 50x50_stratagus_tileset243 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (243).png")] 
 [name "50x50_stratagus_tileset243"])) 
(define 50x50_stratagus_tileset242 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (242).png")] 
 [name "50x50_stratagus_tileset242"])) 
(define 50x50_stratagus_tileset241 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (241).png")] 
 [name "50x50_stratagus_tileset241"])) 
(define 50x50_stratagus_tileset240 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (240).png")] 
 [name "50x50_stratagus_tileset240"])) 
(define 50x50_stratagus_tileset239 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (239).png")] 
 [name "50x50_stratagus_tileset239"])) 
(define 50x50_stratagus_tileset238 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (238).png")] 
 [name "50x50_stratagus_tileset238"])) 
(define 50x50_stratagus_tileset237 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (237).png")] 
 [name "50x50_stratagus_tileset237"])) 
(define 50x50_stratagus_tileset236 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (236).png")] 
 [name "50x50_stratagus_tileset236"])) 
(define 50x50_stratagus_tileset235 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (235).png")] 
 [name "50x50_stratagus_tileset235"])) 
(define 50x50_stratagus_tileset234 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (234).png")] 
 [name "50x50_stratagus_tileset234"])) 
(define 50x50_stratagus_tileset233 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (233).png")] 
 [name "50x50_stratagus_tileset233"])) 
(define 50x50_stratagus_tileset232 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (232).png")] 
 [name "50x50_stratagus_tileset232"])) 
(define 50x50_stratagus_tileset231 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (231).png")] 
 [name "50x50_stratagus_tileset231"])) 
(define 50x50_stratagus_tileset230 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (230).png")] 
 [name "50x50_stratagus_tileset230"])) 
(define 50x50_stratagus_tileset229 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (229).png")] 
 [name "50x50_stratagus_tileset229"])) 
(define 50x50_stratagus_tileset228 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (228).png")] 
 [name "50x50_stratagus_tileset228"])) 
(define 50x50_stratagus_tileset227 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (227).png")] 
 [name "50x50_stratagus_tileset227"])) 
(define 50x50_stratagus_tileset226 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (226).png")] 
 [name "50x50_stratagus_tileset226"])) 
(define 50x50_stratagus_tileset225 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (225).png")] 
 [name "50x50_stratagus_tileset225"])) 
(define 50x50_stratagus_tileset224 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (224).png")] 
 [name "50x50_stratagus_tileset224"])) 
(define 50x50_stratagus_tileset223 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (223).png")] 
 [name "50x50_stratagus_tileset223"])) 
(define 50x50_stratagus_tileset222 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (222).png")] 
 [name "50x50_stratagus_tileset222"])) 
(define 50x50_stratagus_tileset221 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (221).png")] 
 [name "50x50_stratagus_tileset221"])) 
(define 50x50_stratagus_tileset220 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (220).png")] 
 [name "50x50_stratagus_tileset220"])) 
(define 50x50_stratagus_tileset219 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (219).png")] 
 [name "50x50_stratagus_tileset219"])) 
(define 50x50_stratagus_tileset218 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (218).png")] 
 [name "50x50_stratagus_tileset218"])) 
(define 50x50_stratagus_tileset217 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (217).png")] 
 [name "50x50_stratagus_tileset217"])) 
(define 50x50_stratagus_tileset216 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (216).png")] 
 [name "50x50_stratagus_tileset216"])) 
(define 50x50_stratagus_tileset215 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (215).png")] 
 [name "50x50_stratagus_tileset215"])) 
(define 50x50_stratagus_tileset214 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (214).png")] 
 [name "50x50_stratagus_tileset214"])) 
(define 50x50_stratagus_tileset213 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (213).png")] 
 [name "50x50_stratagus_tileset213"])) 
(define 50x50_stratagus_tileset212 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (212).png")] 
 [name "50x50_stratagus_tileset212"])) 
(define 50x50_stratagus_tileset211 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (211).png")] 
 [name "50x50_stratagus_tileset211"])) 
(define 50x50_stratagus_tileset210 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (210).png")] 
 [name "50x50_stratagus_tileset210"])) 
(define 50x50_stratagus_tileset209 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (209).png")] 
 [name "50x50_stratagus_tileset209"])) 
(define 50x50_stratagus_tileset208 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (208).png")] 
 [name "50x50_stratagus_tileset208"])) 
(define 50x50_stratagus_tileset207 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (207).png")] 
 [name "50x50_stratagus_tileset207"])) 
(define 50x50_stratagus_tileset206 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (206).png")] 
 [name "50x50_stratagus_tileset206"])) 
(define 50x50_stratagus_tileset205 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (205).png")] 
 [name "50x50_stratagus_tileset205"])) 
(define 50x50_stratagus_tileset204 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (204).png")] 
 [name "50x50_stratagus_tileset204"])) 
(define 50x50_stratagus_tileset203 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (203).png")] 
 [name "50x50_stratagus_tileset203"])) 
(define 50x50_stratagus_tileset202 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (202).png")] 
 [name "50x50_stratagus_tileset202"])) 
(define 50x50_stratagus_tileset201 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (201).png")] 
 [name "50x50_stratagus_tileset201"])) 
(define 50x50_stratagus_tileset200 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (200).png")] 
 [name "50x50_stratagus_tileset200"])) 
(define 50x50_stratagus_tileset199 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (199).png")] 
 [name "50x50_stratagus_tileset199"])) 
(define 50x50_stratagus_tileset198 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (198).png")] 
 [name "50x50_stratagus_tileset198"])) 
(define 50x50_stratagus_tileset197 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (197).png")] 
 [name "50x50_stratagus_tileset197"])) 
(define 50x50_stratagus_tileset196 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (196).png")] 
 [name "50x50_stratagus_tileset196"])) 
(define 50x50_stratagus_tileset195 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (195).png")] 
 [name "50x50_stratagus_tileset195"])) 
(define 50x50_stratagus_tileset194 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (194).png")] 
 [name "50x50_stratagus_tileset194"])) 
(define 50x50_stratagus_tileset193 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (193).png")] 
 [name "50x50_stratagus_tileset193"])) 
(define 50x50_stratagus_tileset192 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (192).png")] 
 [name "50x50_stratagus_tileset192"])) 
(define 50x50_stratagus_tileset191 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (191).png")] 
 [name "50x50_stratagus_tileset191"])) 
(define 50x50_stratagus_tileset190 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (190).png")] 
 [name "50x50_stratagus_tileset190"])) 
(define 50x50_stratagus_tileset189 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (189).png")] 
 [name "50x50_stratagus_tileset189"])) 
(define 50x50_stratagus_tileset188 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (188).png")] 
 [name "50x50_stratagus_tileset188"])) 
(define 50x50_stratagus_tileset187 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (187).png")] 
 [name "50x50_stratagus_tileset187"])) 
(define 50x50_stratagus_tileset186 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (186).png")] 
 [name "50x50_stratagus_tileset186"])) 
(define 50x50_stratagus_tileset185 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (185).png")] 
 [name "50x50_stratagus_tileset185"])) 
(define 50x50_stratagus_tileset184 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (184).png")] 
 [name "50x50_stratagus_tileset184"])) 
(define 50x50_stratagus_tileset183 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (183).png")] 
 [name "50x50_stratagus_tileset183"])) 
(define 50x50_stratagus_tileset182 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (182).png")] 
 [name "50x50_stratagus_tileset182"])) 
(define 50x50_stratagus_tileset181 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (181).png")] 
 [name "50x50_stratagus_tileset181"])) 
(define 50x50_stratagus_tileset180 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (180).png")] 
 [name "50x50_stratagus_tileset180"])) 
(define 50x50_stratagus_tileset179 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (179).png")] 
 [name "50x50_stratagus_tileset179"])) 
(define 50x50_stratagus_tileset178 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (178).png")] 
 [name "50x50_stratagus_tileset178"])) 
(define 50x50_stratagus_tileset177 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (177).png")] 
 [name "50x50_stratagus_tileset177"])) 
(define 50x50_stratagus_tileset176 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (176).png")] 
 [name "50x50_stratagus_tileset176"])) 
(define 50x50_stratagus_tileset175 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (175).png")] 
 [name "50x50_stratagus_tileset175"])) 
(define 50x50_stratagus_tileset174 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (174).png")] 
 [name "50x50_stratagus_tileset174"])) 
(define 50x50_stratagus_tileset173 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (173).png")] 
 [name "50x50_stratagus_tileset173"])) 
(define 50x50_stratagus_tileset172 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (172).png")] 
 [name "50x50_stratagus_tileset172"])) 
(define 50x50_stratagus_tileset171 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (171).png")] 
 [name "50x50_stratagus_tileset171"])) 
(define 50x50_stratagus_tileset170 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (170).png")] 
 [name "50x50_stratagus_tileset170"])) 
(define 50x50_stratagus_tileset169 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (169).png")] 
 [name "50x50_stratagus_tileset169"])) 
(define 50x50_stratagus_tileset168 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (168).png")] 
 [name "50x50_stratagus_tileset168"])) 
(define 50x50_stratagus_tileset167 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (167).png")] 
 [name "50x50_stratagus_tileset167"])) 
(define 50x50_stratagus_tileset166 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (166).png")] 
 [name "50x50_stratagus_tileset166"])) 
(define 50x50_stratagus_tileset165 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (165).png")] 
 [name "50x50_stratagus_tileset165"])) 
(define 50x50_stratagus_tileset164 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (164).png")] 
 [name "50x50_stratagus_tileset164"])) 
(define 50x50_stratagus_tileset163 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (163).png")] 
 [name "50x50_stratagus_tileset163"])) 
(define 50x50_stratagus_tileset162 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (162).png")] 
 [name "50x50_stratagus_tileset162"])) 
(define 50x50_stratagus_tileset161 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (161).png")] 
 [name "50x50_stratagus_tileset161"])) 
(define 50x50_stratagus_tileset160 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (160).png")] 
 [name "50x50_stratagus_tileset160"])) 
(define 50x50_stratagus_tileset159 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (159).png")] 
 [name "50x50_stratagus_tileset159"])) 
(define 50x50_stratagus_tileset158 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (158).png")] 
 [name "50x50_stratagus_tileset158"])) 
(define 50x50_stratagus_tileset157 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (157).png")] 
 [name "50x50_stratagus_tileset157"])) 
(define 50x50_stratagus_tileset156 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (156).png")] 
 [name "50x50_stratagus_tileset156"])) 
(define 50x50_stratagus_tileset155 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (155).png")] 
 [name "50x50_stratagus_tileset155"])) 
(define 50x50_stratagus_tileset154 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (154).png")] 
 [name "50x50_stratagus_tileset154"])) 
(define 50x50_stratagus_tileset153 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (153).png")] 
 [name "50x50_stratagus_tileset153"])) 
(define 50x50_stratagus_tileset152 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (152).png")] 
 [name "50x50_stratagus_tileset152"])) 
(define 50x50_stratagus_tileset151 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (151).png")] 
 [name "50x50_stratagus_tileset151"])) 
(define 50x50_stratagus_tileset150 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (150).png")] 
 [name "50x50_stratagus_tileset150"])) 
(define 50x50_stratagus_tileset149 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (149).png")] 
 [name "50x50_stratagus_tileset149"])) 
(define 50x50_stratagus_tileset148 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (148).png")] 
 [name "50x50_stratagus_tileset148"])) 
(define 50x50_stratagus_tileset147 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (147).png")] 
 [name "50x50_stratagus_tileset147"])) 
(define 50x50_stratagus_tileset146 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (146).png")] 
 [name "50x50_stratagus_tileset146"])) 
(define 50x50_stratagus_tileset145 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (145).png")] 
 [name "50x50_stratagus_tileset145"])) 
(define 50x50_stratagus_tileset144 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (144).png")] 
 [name "50x50_stratagus_tileset144"])) 
(define 50x50_stratagus_tileset143 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (143).png")] 
 [name "50x50_stratagus_tileset143"])) 
(define 50x50_stratagus_tileset142 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (142).png")] 
 [name "50x50_stratagus_tileset142"])) 
(define 50x50_stratagus_tileset141 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (141).png")] 
 [name "50x50_stratagus_tileset141"])) 
(define 50x50_stratagus_tileset140 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (140).png")] 
 [name "50x50_stratagus_tileset140"])) 
(define 50x50_stratagus_tileset139 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (139).png")] 
 [name "50x50_stratagus_tileset139"])) 
(define 50x50_stratagus_tileset138 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (138).png")] 
 [name "50x50_stratagus_tileset138"])) 
(define 50x50_stratagus_tileset137 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (137).png")] 
 [name "50x50_stratagus_tileset137"])) 
(define 50x50_stratagus_tileset136 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (136).png")] 
 [name "50x50_stratagus_tileset136"])) 
(define 50x50_stratagus_tileset135 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (135).png")] 
 [name "50x50_stratagus_tileset135"])) 
(define 50x50_stratagus_tileset134 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (134).png")] 
 [name "50x50_stratagus_tileset134"])) 
(define 50x50_stratagus_tileset133 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (133).png")] 
 [name "50x50_stratagus_tileset133"])) 
(define 50x50_stratagus_tileset132 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (132).png")] 
 [name "50x50_stratagus_tileset132"])) 
(define 50x50_stratagus_tileset131 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (131).png")] 
 [name "50x50_stratagus_tileset131"])) 
(define 50x50_stratagus_tileset130 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (130).png")] 
 [name "50x50_stratagus_tileset130"])) 
(define 50x50_stratagus_tileset129 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (129).png")] 
 [name "50x50_stratagus_tileset129"])) 
(define 50x50_stratagus_tileset128 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (128).png")] 
 [name "50x50_stratagus_tileset128"])) 
(define 50x50_stratagus_tileset127 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (127).png")] 
 [name "50x50_stratagus_tileset127"])) 
(define 50x50_stratagus_tileset126 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (126).png")] 
 [name "50x50_stratagus_tileset126"])) 
(define 50x50_stratagus_tileset125 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (125).png")] 
 [name "50x50_stratagus_tileset125"])) 
(define 50x50_stratagus_tileset124 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (124).png")] 
 [name "50x50_stratagus_tileset124"])) 
(define 50x50_stratagus_tileset123 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (123).png")] 
 [name "50x50_stratagus_tileset123"])) 
(define 50x50_stratagus_tileset122 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (122).png")] 
 [name "50x50_stratagus_tileset122"])) 
(define 50x50_stratagus_tileset121 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (121).png")] 
 [name "50x50_stratagus_tileset121"])) 
(define 50x50_stratagus_tileset120 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (120).png")] 
 [name "50x50_stratagus_tileset120"])) 
(define 50x50_stratagus_tileset119 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (119).png")] 
 [name "50x50_stratagus_tileset119"])) 
(define 50x50_stratagus_tileset118 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (118).png")] 
 [name "50x50_stratagus_tileset118"])) 
(define 50x50_stratagus_tileset117 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (117).png")] 
 [name "50x50_stratagus_tileset117"])) 
(define 50x50_stratagus_tileset116 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (116).png")] 
 [name "50x50_stratagus_tileset116"])) 
(define 50x50_stratagus_tileset115 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (115).png")] 
 [name "50x50_stratagus_tileset115"])) 
(define 50x50_stratagus_tileset114 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (114).png")] 
 [name "50x50_stratagus_tileset114"])) 
(define 50x50_stratagus_tileset113 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (113).png")] 
 [name "50x50_stratagus_tileset113"])) 
(define 50x50_stratagus_tileset112 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (112).png")] 
 [name "50x50_stratagus_tileset112"])) 
(define 50x50_stratagus_tileset111 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (111).png")] 
 [name "50x50_stratagus_tileset111"])) 
(define 50x50_stratagus_tileset110 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (110).png")] 
 [name "50x50_stratagus_tileset110"])) 
(define 50x50_stratagus_tileset109 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (109).png")] 
 [name "50x50_stratagus_tileset109"])) 
(define 50x50_stratagus_tileset108 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (108).png")] 
 [name "50x50_stratagus_tileset108"])) 
(define 50x50_stratagus_tileset107 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (107).png")] 
 [name "50x50_stratagus_tileset107"])) 
(define 50x50_stratagus_tileset106 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (106).png")] 
 [name "50x50_stratagus_tileset106"])) 
(define 50x50_stratagus_tileset105 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (105).png")] 
 [name "50x50_stratagus_tileset105"])) 
(define 50x50_stratagus_tileset104 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (104).png")] 
 [name "50x50_stratagus_tileset104"])) 
(define 50x50_stratagus_tileset103 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (103).png")] 
 [name "50x50_stratagus_tileset103"])) 
(define 50x50_stratagus_tileset102 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (102).png")] 
 [name "50x50_stratagus_tileset102"])) 
(define 50x50_stratagus_tileset101 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (101).png")] 
 [name "50x50_stratagus_tileset101"])) 
(define 50x50_stratagus_tileset100 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (100).png")] 
 [name "50x50_stratagus_tileset100"])) 
(define 50x50_stratagus_tileset99 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (99).png")] 
 [name "50x50_stratagus_tileset99"])) 
(define 50x50_stratagus_tileset98 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (98).png")] 
 [name "50x50_stratagus_tileset98"])) 
(define 50x50_stratagus_tileset97 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (97).png")] 
 [name "50x50_stratagus_tileset97"])) 
(define 50x50_stratagus_tileset96 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (96).png")] 
 [name "50x50_stratagus_tileset96"])) 
(define 50x50_stratagus_tileset95 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (95).png")] 
 [name "50x50_stratagus_tileset95"])) 
(define 50x50_stratagus_tileset94 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (94).png")] 
 [name "50x50_stratagus_tileset94"])) 
(define 50x50_stratagus_tileset93 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (93).png")] 
 [name "50x50_stratagus_tileset93"])) 
(define 50x50_stratagus_tileset92 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (92).png")] 
 [name "50x50_stratagus_tileset92"])) 
(define 50x50_stratagus_tileset91 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (91).png")] 
 [name "50x50_stratagus_tileset91"])) 
(define 50x50_stratagus_tileset90 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (90).png")] 
 [name "50x50_stratagus_tileset90"])) 
(define 50x50_stratagus_tileset89 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (89).png")] 
 [name "50x50_stratagus_tileset89"])) 
(define 50x50_stratagus_tileset88 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (88).png")] 
 [name "50x50_stratagus_tileset88"])) 
(define 50x50_stratagus_tileset87 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (87).png")] 
 [name "50x50_stratagus_tileset87"])) 
(define 50x50_stratagus_tileset86 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (86).png")] 
 [name "50x50_stratagus_tileset86"])) 
(define 50x50_stratagus_tileset85 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (85).png")] 
 [name "50x50_stratagus_tileset85"])) 
(define 50x50_stratagus_tileset84 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (84).png")] 
 [name "50x50_stratagus_tileset84"])) 
(define 50x50_stratagus_tileset83 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (83).png")] 
 [name "50x50_stratagus_tileset83"])) 
(define 50x50_stratagus_tileset82 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (82).png")] 
 [name "50x50_stratagus_tileset82"])) 
(define 50x50_stratagus_tileset81 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (81).png")] 
 [name "50x50_stratagus_tileset81"])) 
(define 50x50_stratagus_tileset80 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (80).png")] 
 [name "50x50_stratagus_tileset80"])) 
(define 50x50_stratagus_tileset79 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (79).png")] 
 [name "50x50_stratagus_tileset79"])) 
(define 50x50_stratagus_tileset78 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (78).png")] 
 [name "50x50_stratagus_tileset78"])) 
(define 50x50_stratagus_tileset77 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (77).png")] 
 [name "50x50_stratagus_tileset77"])) 
(define 50x50_stratagus_tileset76 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (76).png")] 
 [name "50x50_stratagus_tileset76"])) 
(define 50x50_stratagus_tileset75 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (75).png")] 
 [name "50x50_stratagus_tileset75"])) 
(define 50x50_stratagus_tileset74 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (74).png")] 
 [name "50x50_stratagus_tileset74"])) 
(define 50x50_stratagus_tileset73 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (73).png")] 
 [name "50x50_stratagus_tileset73"])) 
(define 50x50_stratagus_tileset72 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (72).png")] 
 [name "50x50_stratagus_tileset72"])) 
(define 50x50_stratagus_tileset71 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (71).png")] 
 [name "50x50_stratagus_tileset71"])) 
(define 50x50_stratagus_tileset70 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (70).png")] 
 [name "50x50_stratagus_tileset70"])) 
(define 50x50_stratagus_tileset69 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (69).png")] 
 [name "50x50_stratagus_tileset69"])) 
(define 50x50_stratagus_tileset68 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (68).png")] 
 [name "50x50_stratagus_tileset68"])) 
(define 50x50_stratagus_tileset67 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (67).png")] 
 [name "50x50_stratagus_tileset67"])) 
(define 50x50_stratagus_tileset66 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (66).png")] 
 [name "50x50_stratagus_tileset66"])) 
(define 50x50_stratagus_tileset65 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (65).png")] 
 [name "50x50_stratagus_tileset65"])) 
(define 50x50_stratagus_tileset64 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (64).png")] 
 [name "50x50_stratagus_tileset64"])) 
(define 50x50_stratagus_tileset63 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (63).png")] 
 [name "50x50_stratagus_tileset63"])) 
(define 50x50_stratagus_tileset62 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (62).png")] 
 [name "50x50_stratagus_tileset62"])) 
(define 50x50_stratagus_tileset61 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (61).png")] 
 [name "50x50_stratagus_tileset61"])) 
(define 50x50_stratagus_tileset60 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (60).png")] 
 [name "50x50_stratagus_tileset60"])) 
(define 50x50_stratagus_tileset59 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (59).png")] 
 [name "50x50_stratagus_tileset59"])) 
(define 50x50_stratagus_tileset58 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (58).png")] 
 [name "50x50_stratagus_tileset58"])) 
(define 50x50_stratagus_tileset57 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (57).png")] 
 [name "50x50_stratagus_tileset57"])) 
(define 50x50_stratagus_tileset56 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (56).png")] 
 [name "50x50_stratagus_tileset56"])) 
(define 50x50_stratagus_tileset55 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (55).png")] 
 [name "50x50_stratagus_tileset55"])) 
(define 50x50_stratagus_tileset54 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (54).png")] 
 [name "50x50_stratagus_tileset54"])) 
(define 50x50_stratagus_tileset53 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (53).png")] 
 [name "50x50_stratagus_tileset53"])) 
(define 50x50_stratagus_tileset52 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (52).png")] 
 [name "50x50_stratagus_tileset52"])) 
(define 50x50_stratagus_tileset51 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (51).png")] 
 [name "50x50_stratagus_tileset51"])) 
(define 50x50_stratagus_tileset50 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (50).png")] 
 [name "50x50_stratagus_tileset50"])) 
(define 50x50_stratagus_tileset49 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (49).png")] 
 [name "50x50_stratagus_tileset49"])) 
(define 50x50_stratagus_tileset48 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (48).png")] 
 [name "50x50_stratagus_tileset48"])) 
(define 50x50_stratagus_tileset47 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (47).png")] 
 [name "50x50_stratagus_tileset47"])) 
(define 50x50_stratagus_tileset46 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (46).png")] 
 [name "50x50_stratagus_tileset46"])) 
(define 50x50_stratagus_tileset45 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (45).png")] 
 [name "50x50_stratagus_tileset45"])) 
(define 50x50_stratagus_tileset44 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (44).png")] 
 [name "50x50_stratagus_tileset44"])) 
(define 50x50_stratagus_tileset43 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (43).png")] 
 [name "50x50_stratagus_tileset43"])) 
(define 50x50_stratagus_tileset42 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (42).png")] 
 [name "50x50_stratagus_tileset42"])) 
(define 50x50_stratagus_tileset41 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (41).png")] 
 [name "50x50_stratagus_tileset41"])) 
(define 50x50_stratagus_tileset40 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (40).png")] 
 [name "50x50_stratagus_tileset40"])) 
(define 50x50_stratagus_tileset39 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (39).png")] 
 [name "50x50_stratagus_tileset39"])) 
(define 50x50_stratagus_tileset38 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (38).png")] 
 [name "50x50_stratagus_tileset38"])) 
(define 50x50_stratagus_tileset37 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (37).png")] 
 [name "50x50_stratagus_tileset37"])) 
(define 50x50_stratagus_tileset36 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (36).png")] 
 [name "50x50_stratagus_tileset36"])) 
(define 50x50_stratagus_tileset35 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (35).png")] 
 [name "50x50_stratagus_tileset35"])) 
(define 50x50_stratagus_tileset34 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (34).png")] 
 [name "50x50_stratagus_tileset34"])) 
(define 50x50_stratagus_tileset33 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (33).png")] 
 [name "50x50_stratagus_tileset33"])) 
(define 50x50_stratagus_tileset32 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (32).png")] 
 [name "50x50_stratagus_tileset32"])) 
(define 50x50_stratagus_tileset31 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (31).png")] 
 [name "50x50_stratagus_tileset31"])) 
(define 50x50_stratagus_tileset30 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (30).png")] 
 [name "50x50_stratagus_tileset30"])) 
(define 50x50_stratagus_tileset29 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (29).png")] 
 [name "50x50_stratagus_tileset29"])) 
(define 50x50_stratagus_tileset28 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (28).png")] 
 [name "50x50_stratagus_tileset28"])) 
(define 50x50_stratagus_tileset27 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (27).png")] 
 [name "50x50_stratagus_tileset27"])) 
(define 50x50_stratagus_tileset26 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (26).png")] 
 [name "50x50_stratagus_tileset26"])) 
(define 50x50_stratagus_tileset25 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (25).png")] 
 [name "50x50_stratagus_tileset25"])) 
(define 50x50_stratagus_tileset24 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (24).png")] 
 [name "50x50_stratagus_tileset24"])) 
(define 50x50_stratagus_tileset23 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (23).png")] 
 [name "50x50_stratagus_tileset23"])) 
(define 50x50_stratagus_tileset22 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (22).png")] 
 [name "50x50_stratagus_tileset22"])) 
(define 50x50_stratagus_tileset21 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (21).png")] 
 [name "50x50_stratagus_tileset21"])) 
(define 50x50_stratagus_tileset20 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (20).png")] 
 [name "50x50_stratagus_tileset20"])) 
(define 50x50_stratagus_tileset19 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (19).png")] 
 [name "50x50_stratagus_tileset19"])) 
(define 50x50_stratagus_tileset18 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (18).png")] 
 [name "50x50_stratagus_tileset18"])) 
(define 50x50_stratagus_tileset17 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (17).png")] 
 [name "50x50_stratagus_tileset17"])) 
(define 50x50_stratagus_tileset16 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (16).png")] 
 [name "50x50_stratagus_tileset16"])) 
(define 50x50_stratagus_tileset15 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (15).png")] 
 [name "50x50_stratagus_tileset15"])) 
(define 50x50_stratagus_tileset14 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (14).png")] 
 [name "50x50_stratagus_tileset14"])) 
(define 50x50_stratagus_tileset13 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (13).png")] 
 [name "50x50_stratagus_tileset13"])) 
(define 50x50_stratagus_tileset12 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (12).png")] 
 [name "50x50_stratagus_tileset12"])) 
(define 50x50_stratagus_tileset11 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (11).png")] 
 [name "50x50_stratagus_tileset11"])) 
(define 50x50_stratagus_tileset10 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (10).png")] 
 [name "50x50_stratagus_tileset10"])) 
(define 50x50_stratagus_tileset9 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (9).png")] 
 [name "50x50_stratagus_tileset9"])) 
(define 50x50_stratagus_tileset8 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (8).png")] 
 [name "50x50_stratagus_tileset8"])) 
(define 50x50_stratagus_tileset7 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (7).png")] 
 [name "50x50_stratagus_tileset7"])) 
(define 50x50_stratagus_tileset6 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (6).png")] 
 [name "50x50_stratagus_tileset6"])) 
(define 50x50_stratagus_tileset5 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (5).png")] 
 [name "50x50_stratagus_tileset5"])) 
(define 50x50_stratagus_tileset4 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (4).png")] 
 [name "50x50_stratagus_tileset4"])) 
(define 50x50_stratagus_tileset3 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (3).png")] 
 [name "50x50_stratagus_tileset3"])) 
(define 50x50_stratagus_tileset2 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (2).png")] 
 [name "50x50_stratagus_tileset2"])) 
(define 50x50_stratagus_tileset1 (new texture% 
 [texture (read-bitmap "50x50_stratagus_tileset (1).png")] 
 [name "50x50_stratagus_tileset1"])) 
