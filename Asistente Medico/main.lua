--------------------------------------------------------------------------------
-- Asistente Médico - Solar2D
--------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")
local media = require("media")

local cx = display.contentCenterX
local cy = display.contentCenterY
local W = display.contentWidth
local H = display.contentHeight

--------------------------------------------------------------------------------
-- FONDO
--------------------------------------------------------------------------------

local fondo = display.newImageRect("fondo_clinica.png", W, H)
fondo.x = cx
fondo.y = cy

--------------------------------------------------------------------------------
-- TEXTO PRINCIPAL
--------------------------------------------------------------------------------

local texto = display.newText({
    text = "Selecciona una emergencia para obtener ayuda.",
    x = cx,
    y = 80,
    width = 300,
    font = native.systemFont,
    fontSize = 18,
    align = "center"
})

texto:setFillColor(1,1,1)

--------------------------------------------------------------------------------
-- LISTENER DEL VIDEO
--------------------------------------------------------------------------------

local function videoListener(event)

    if event.phase == "ended" then
        print("Video terminado")
    end

end

--------------------------------------------------------------------------------
-- REPRODUCIR VIDEO
--------------------------------------------------------------------------------

local function reproducirVideo(nombreVideo)
  local path = system.pathForFile(nombreVideo, system.ResourceDirectory)

  if not path then
    native.showAlert("Error", "No se encontró el archivo:\n"..nombreVideo, {"OK"})
    return
  end

  media.playVideo(nombreVideo, system.ResourceDirectory, true)
end

--------------------------------------------------------------------------------
-- MOSTRAR INSTRUCCIONES
--------------------------------------------------------------------------------

local function mostrarInstrucciones(titulo, mensaje, video)

    local function listener(event)

        if event.action == "clicked" then
            reproducirVideo(video) 
        end

    end

    native.showAlert(titulo, mensaje, {"Ver Video"}, listener)

end

--------------------------------------------------------------------------------
-- CREAR BOTÓN
--------------------------------------------------------------------------------

local function crearBoton(titulo, x, y, mensaje, video)

    widget.newButton({

        label = titulo,
        x = x,
        y = y,

        width = 150,
        height = 70,

        shape = "roundedRect",
        cornerRadius = 12,

        fillColor = {
            default = {0.2,0.6,1},
            over = {0.1,0.4,0.8}
        },

        labelColor = {
            default = {1},
            over = {0.9}
        },

        fontSize = 14,

        onRelease = function()

            mostrarInstrucciones(titulo, mensaje, video)
            return true

        end
    })

end

--------------------------------------------------------------------------------
-- POSICIONES DE BOTONES (2 COLUMNAS)
--------------------------------------------------------------------------------

local col1 = cx - 90
local col2 = cx + 90

local fila1 = 160
local fila2 = 240
local fila3 = 320
local fila4 = 400

--------------------------------------------------------------------------------
-- BOTONES DE EMERGENCIA
--------------------------------------------------------------------------------

crearBoton(
"RCP",
col1, fila1,
"1. Verifica si no respira.\n2. Llama al 911.\n3. Inicia compresiones.",
"RCP.mp4"
)

crearBoton(
"Heridas",
col2, fila1,
"1. Lava con agua y jabón.\n2. Aplica presión.\n3. Cubre con venda.",
"HERIDA.mp4"
)

crearBoton(
"Quemaduras",
col1, fila2,
"1. Enfría con agua.\n2. No revientes ampollas.\n3. Cubre con gasa.",
"QUEMADURA.mp4"
)

crearBoton(
"Asfixia",
col2, fila2,
"1. Golpea la espalda.\n2. Aplica Heimlich si es necesario.",
"ASFIXIA.mp4"
)

crearBoton(
"Desmayo",
col1, fila3,
"1. Acuesta a la persona.\n2. Eleva las piernas.\n3. Afloja la ropa.",
"DESMAYO.mp4"
)

crearBoton(
"Crisis emocional",
col2, fila3,
"1. Lleva a la persona a un lugar tranquilo.\n2. Respira profundo.\n3. Mantén la calma.",
"ESTRES.mp4"
)

crearBoton(
"Picadura mosquito",
col1, fila4,
"1. Lava la zona con agua y jabón.\n2. Aplica hielo.\n3. No rascar.",
"MOSQUITO.mp4"
)

--------------------------------------------------------------------------------
-- BOTÓN NÚMEROS DE EMERGENCIA
--------------------------------------------------------------------------------

local function mostrarNumerosEmergencia()

    local mensaje =
    "🚨 Emergencias: 911\n"..
    "🚑 Cruz Roja: 55 53 95 11 11\n"..
    "📍 LOCATEL: 55 56 58 11 11\n"..
    "🔥 Incendios: 800 46 23 63 46"

    native.showAlert("Números de Emergencia", mensaje, {"OK"})

end

widget.newButton({

    label = "Números de Emergencia",

    x = cx,
    y = H - 40,

    width = 250,
    height = 50,

    shape = "roundedRect",
    cornerRadius = 12,

    fillColor = {
        default = {1,0,0},
        over = {0.8,0,0}
    },

    labelColor = {
        default = {1},
        over = {0.9}
    },

    fontSize = 16,

    onRelease = function()

        mostrarNumerosEmergencia()
        return true

    end
})