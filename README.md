📥 التثبيت — شرح كامل ومفصّل

هذا قسم التثبيت موسّعاً بكل التفاصيل، مع كل الطرق الممكنة، وحلول المشاكل. انسخه مكان قسم التثبيت في README.md الخاص بك.

---

```markdown
## 📥 التثبيت

قبل أن تبدأ، تحتاج شيئين فقط:
1. **مشغّل سكربتات** (Executor) يدعم `loadstring` و `HttpGet`
2. **رابط Raw** لملف `RayUI.lua` (من GitHub أو أي استضافة)

> ⚠️ **مهم**: إذا كنت تستخدم المستودع خاصتك، تأكد أنه **Public** حتى يعمل `game:HttpGet` بدون مشاكل. المستودعات الخاصة تتطلب توكن ولا تعمل مع `HttpGet` العادي.

---

### ⚡ الطريقة 1: التحميل المباشر من GitHub (موصى به)

هذه أسهل وأسرع طريقة. كل ما تحتاجه سطر واحد:

```lua
local RayUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/USERNAME/RayUI/main/RayUI.lua"))()
```

كيف تحصل على الرابط الصحيح؟

1. افتح مستودعك على GitHub
2. انقر على ملف RayUI.lua
3. في الزاوية العلوية اليمنى، انقر زر Raw
4. سيُفتح رابط يبدأ بـ https://raw.githubusercontent.com/...
5. انسخ هذا الرابط — هذا هو ما تستخدمه في HttpGet

مثال على الرابط الصحيح:

```text
https://raw.githubusercontent.com/USERNAME/RayUI/main/RayUI.lua
```

مثال على رابط خاطئ (لا يعمل):

```text
https://github.com/USERNAME/RayUI/blob/main/RayUI.lua   ❌ (صفحة HTML وليس كود)
```

💡 الفرق: رابط github.com/.../blob/... يفتح صفحة ويب فيها الكود. رابط raw.githubusercontent.com/... يعطيك الكود الخام الذي يفهمه HttpGet.

---

📋 الطريقة 2: نسخ الكود مباشرة (بدون GitHub)

إذا ما عندك GitHub أو ما تريد رفع المكتبة:

1. افتح ملف RayUI.lua في المستودع
2. انقر على زر Raw أو Copy
3. الصق الكود كاملاً في بداية سكربتك قبل أي استخدام
4. لا تحتاج loadstring أو HttpGet — الكود موجود مباشرة

مثال:

```lua
-- ═══════════════════════════════════════════
-- الصق كل كود RayUI هنا (آلاف الأسطر)
-- ═══════════════════════════════════════════

-- بعدها استخدمه عادي:
local win = RayUI:CreateWindow({ Title = "سكربتي" })
```

متى تستخدم هذه الطريقة؟

· ✅ إذا كنت توزع سكربتك كملف واحد
· ✅ إذا ما عندك اتصال إنترنت أو GitHub
· ✅ إذا تريد تجنب مشاكل HttpGet
· ❌ لا تناسب إذا أردت تحديثات تلقائية

---

📦 الطريقة 3: رفع المكتبة على مستودعك الخاص

إذا أردت تحكم كامل بالمكتبة (تعديلاتك الخاصة):

خطوات الرفع:

1. أنشئ مستودعاً جديداً

· اذهب إلى github.com/new
· اسم المستودع: RayUI
· اختر Public (مهم!)
· انقر Create repository

2. ارفع ملف RayUI.lua

· في صفحة المستودع، انقر Add file → Upload files
· اسحب ملف RayUI.lua أو انقر لاختياره
· أدخل رسالة commit مثل "add RayUI library"
· انقر Commit changes

3. احصل على رابط Raw

· انقر على RayUI.lua في المستودع
· انقر زر Raw
· انسخ رابط المتصفح

4. استخدمه في سكربتك

```lua
local RayUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USER/YOUR_REPO/main/RayUI.lua"))()
```

---

🌐 الطريقة 4: استخدام CDN بديل (jsDelivr)

إذا واجهت مشاكل في التخزين المؤقت (Caching) مع GitHub، استخدم jsDelivr:

```lua
local RayUI = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/USERNAME/RayUI@main/RayUI.lua"))()
```

مميزات jsDelivr:

· ⚡ أسرع من GitHub أحياناً
· 🔄 تحديثات فورية (بدون cache delay)
· 🌍 سيرفرات موزعة عالمياً

صيغة الرابط:

```text
https://cdn.jsdelivr.net/gh/USERNAME/REPO@BRANCH/PATH
```

---

🎯 الطريقة 5: استضافة خارجية (Pastebin / Hastebin)

إذا ما تريد GitHub، استخدم Pastebin:

1. ارفع الكود على Pastebin

· اذهب إلى pastebin.com
· الصق الكود كاملاً
· اختر Raw في خيارات الصياغة
· انقر Create New Paste
· انسخ رابط Raw

2. استخدمه

```lua
local RayUI = loadstring(game:HttpGet("https://pastebin.com/raw/XXXXXX"))()
```

⚠️ تحذير: Pastebin قد يحذف الأكواد البرمجية بسبب سياسة المحتوى. GitHub أكثر أماناً.

---

🚀 البدء السريع بعد التثبيت

بعد تحميل المكتبة في متغير RayUI، ابدأ بأبسط شكل:

```lua
-- 1. تحميل المكتبة
local RayUI = loadstring(game:HttpGet("YOUR_RAW_URL"))()

-- 2. شاشة تحميل (اختياري)
RayUI:PlayBoot("Pro Max", "سكربتي", 2)
task.wait(2.2)

-- 3. إنشاء النافذة
local win = RayUI:CreateWindow({
    Title = "سكربتي",
    Theme = "Neon",
})

-- 4. إضافة تبويب
local tab = win:AddTab("الرئيسية")

-- 5. إضافة زر
RayUI:AddButton(tab, {
    Name = "اضغط هنا",
    Callback = function()
        RayUI:Notify("✅ نجاح", "تم التنفيذ!", 3)
    end,
})

-- 6. إشعار ترحيبي
RayUI:Notify("👋 أهلاً", "مرحباً في سكربتي!", 3)
```

---

🔧 استكشاف الأخطاء الشائعة

<details>
<summary><b>❌ خطأ: <code>HttpGet failed</code> أو <code>HTTP 404</code></b></summary>

الأسباب المحتملة:

· الرابط خاطئ (تحقق من raw.githubusercontent.com وليس github.com/.../blob/)
· اسم المستخدم أو المستودع مكتوب بشكل خاطئ
· الفرع (Branch) ليس main — قد يكون master أو غيره
· الملف غير موجود أو تم حذفه

الحل:

1. افتح الرابط في المتصفح — إذا لم يظهر كود Lua خام، الرابط خاطئ
2. تأكد من اسم المستودع والملف
3. تأكد من الفرع (main أو master)

</details>

<details>
<summary><b>❌ خطأ: <code>attempt to index nil value</code></b></summary>

السبب: loadstring رجّع nil، عادةً لأن HttpGet فشل أو أرجع محتوى فارغ.

الحل:

```lua
local success, result = pcall(function()
    return game:HttpGet("YOUR_URL")
end)

if not success or not result or result == "" then
    warn("فشل تحميل RayUI")
    return
end

local RayUI = loadstring(result)()
```

</details>

<details>
<summary><b>❌ خطأ: <code>loadstring not available</code></b></summary>

السبب: المشغّل لا يدعم loadstring أو الخاصية معطلة.

الحل:

· استخدم مشغلاً حديثاً يدعم loadstring (Synapse, Krnl, Fluxus, Delta, Solara)
· لا تستخدم مشغلات قديمة أو محظورة
· جرب مشغلاً آخر إذا استمرت المشكلة

</details>

<details>
<summary><b>❌ المكتبة تعمل لكن النافذة لا تظهر</b></summary>

الأسباب:

1. الحقوق: السكربت لا يملك صلاحية الكتابة في CoreGui (بعض المشغلات القديمة)
2. الترتيب: DisplayOrder منخفض جداً
3. خطأ سابق: هناك خطأ في console يمنع الوصول

الحل:

```lua
-- افتح Console (F9) وتحقق من الأخطاء
-- جرب فرض Parent:
local win = RayUI:CreateWindow({ ... })

-- إذا كانت المشكلة في CoreGui، جرب PlayerGui:
-- (RayUI يحاول CoreGui أولاً ثم PlayerGui تلقائياً)
```

</details>

<details>
<summary><b>❌ خطأ: <code>Http requests are not enabled</code></b></summary>

السبب: خاصية "Allow HTTP Requests" معطلة في Roblox Studio.

الحل (في Roblox Studio):

1. افتح Home → Game Settings
2. اذهب إلى Security
3. فعّل Allow HTTP Requests
4. أعد التشغيل

في المشغّلات (Executors): الخاصية مفعلة افتراضياً، فالمشكلة من الرابط نفسه.

</details>

<details>
<summary><b>❌ التحديثات لا تظهر (Cache issue)</b></summary>

السبب: GitHub يخزن الملفات مؤقتاً (Cache) لمدة قد تصل إلى 5 دقائق.

الحل:

1. استخدم رابط jsDelivr بدلاً من GitHub:

```lua
loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/USERNAME/RayUI@main/RayUI.lua"))()
```

2. أو أضف ?t= + رقم عشوائي في النهاية:

```lua
local url = "https://raw.githubusercontent.com/.../RayUI.lua?t=" .. tick()
```

</details>

<details>
<summary><b>❌ المشغّل يغلق فوراً عند التحميل</b></summary>

السبب: كود خاطئ، أو خطأ في المكتبة، أو حماية من المشغّل.

الحل:

1. تحقق من أن الكود الكامل موجود (لم يتم قصه أثناء النسخ)
2. جرب pcall:

```lua
local ok, err = pcall(function()
    loadstring(game:HttpGet("YOUR_URL"))()
end)
if not ok then warn("خطأ: " .. tostring(err)) end
```

3. جرب مشغلاً آخر

</details>

---

✅ قائمة التحقق قبل الاستخدام

قبل أن تشغّل سكربتك، تأكد من:

☐ المستودع Public وليس Private
☐ الرابط يستخدم raw.githubusercontent.com وليس github.com/.../blob/
☐ الملف RayUI.lua موجود والاسم صحيح
☐ المشغّل يدعم loadstring و HttpGet
☐ لا يوجد خطأ في Console (F9)
☐ الكود لم يُقص أثناء النسخ (إذا اخترت الطريقة 2)

---

📊 مقارنة الطرق

الطريقة السرعة التحديث الأمان التعقيد
GitHub Raw ⚡⚡⚡ ✅ تلقائي ✅ عالي ⭐ بسيط
نسخ مباشر ⚡⚡ ❌ يدوي ✅ عالي ⭐ بسيط
مستودعك الخاص ⚡⚡⚡ ✅ تلقائي ✅ عالي ⭐⭐ متوسط
jsDelivr CDN ⚡⚡⚡⚡ ✅ فوري ✅ عالي ⭐ بسيط
Pastebin ⚡⚡ ❌ يدوي ⚠️ متوسط ⭐ بسيط

---

🎓 نصائح احترافية

1. استخدم رابطاً في متغير لتسهيل التعديل:
   ```lua
   local RAYUI_URL = "https://raw.githubusercontent.com/USERNAME/RayUI/main/RayUI.lua"
   local RayUI = loadstring(game:HttpGet(RAYUI_URL))()
   ```
2. أضف حماية pcall حول التحميل:
   ```lua
   local ok, RayUI = pcall(function()
       return loadstring(game:HttpGet(RAYUI_URL))()
   end)
   if not ok then
       warn("فشل تحميل RayUI: " .. tostring(RayUI))
       return
   end
   ```
3. تحقق من الإصدار:
   ```lua
   print("RayUI Version: " .. RayUI.Version)
   ```
4. احفظ الإعدادات بعد أول استخدام:
   ```lua
   RayUI:LoadConfig()
   ```

---


بعد التثبيت، انتقل إلى البدء السريع لبناء أول واجهة لك!

```

---

## ✅ ما أضفته في هذا الشرح

| القسم | التفصيل |
|-------|---------|
| 🎯 **المقدمة** | شرح المتطلبات الأساسية |
| ⚡ **5 طرق تثبيت** | GitHub، نسخ مباشر، مستودعك، jsDelivr، Pastebin |
| 🔍 **الفرق بين الروابط** | `raw.githubusercontent.com` vs `github.com/.../blob/` |
| 🚀 **البدء السريع** | مثال كامل بعد التثبيت |
| 🔧 **7 مشاكل شائعة** | مع حلول مفصلة داخل Collapsible |
| ✅ **Checklist** | قائمة تحقق قبل الاستخدام |
| 📊 **جدول مقارنة** | بين كل الطرق (سرعة، تحديث، أمان) |
| 🎓 **نصائح احترافية** | pcall، إصدار، حفظ |
| 🎯 **خلاصة** | توصيات حسب نوع المستخدم |

انسخ القسم كاملاً واستبدل به قسم **التثبيت** الحالي في `README.md`. 🚀
